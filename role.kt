package com.kotlindiscord.bot.utils

import com.kotlindiscord.bot.config.config
import com.kotlindiscord.bot.enums.Roles
import dev.kord.core.entity.Role

/**
 * Convenience function to convert a [Role] object to a [Roles] enum value.
 *
 * @receiver The [Role] to convert.
 * @return The corresponding [Roles] enum value, or `null` if no corresponding value exists.
 */
fun Role.toEnum(): Roles? {
    for (role in Roles.values()) {
        if (this.id == config.getRoleSnowflake(role)) {
            return role
        }
    }

    return null
}
