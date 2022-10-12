package com.kotlindiscord.bot.utils

import com.kotlindiscord.kord.extensions.utils.createdAt
import dev.kord.core.entity.User
import java.time.Instant
import java.time.temporal.ChronoUnit

private const val NEW_DAYS = 3L

/**
 * Given a Kord User object, return a string that contains their mention, tag and ID together.
 */
fun User.readable(): String = "$mention (`$tag` / `${id.value}`)"

/**
 * Check whether this is a user that was created recently.
 *
 * @return Whether the user was created in the last 3 days.
 */
fun User.isNew(): Boolean = this.createdAt.isAfter(Instant.now().minus(NEW_DAYS, ChronoUnit.DAYS))
