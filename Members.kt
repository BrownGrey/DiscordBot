package com.kotlindiscord.bot.utils

import com.kotlindiscord.bot.enums.Emojis
import com.kotlindiscord.bot.extensions.EmojiExtension
import dev.kord.common.entity.PresenceStatus
import dev.kord.common.entity.Snowflake
import dev.kord.core.entity.Member
import dev.kord.core.entity.User

/**
 * Given a nullable user object and nullable snowflake, attempt to get a member ID.
 *
 * This is used to validate command argument.
 *
 * @param member User object, or null.
 * @param id User snowflake, or null.
 *
 * @return A Pair containing the result and an optional message to return.
 */
fun getMemberId(member: User?, id: Snowflake?): Pair<Snowflake?, String?> {
    return if (member == null && id == null) {
        Pair(null, "Please specify a user argument.")
    } else if (member != null && id != null) {
        Pair(null, "Please specify exactly one user argument, not two.")
    } else {
        Pair(member?.id ?: id!!, null)
    }
}

/**
 * Retrieve the relevant status emoji mention for a given [Member].
 */
suspend fun Member.getStatusEmoji() = when (this.getPresenceOrNull()?.status) {
    PresenceStatus.DoNotDisturb -> EmojiExtension.getEmoji(Emojis.STATUS_DND)
    PresenceStatus.Idle -> EmojiExtension.getEmoji(Emojis.STATUS_AWAY)
    PresenceStatus.Online -> EmojiExtension.getEmoji(Emojis.STATUS_ONLINE)

    else -> EmojiExtension.getEmoji(Emojis.STATUS_OFFLINE)
}
