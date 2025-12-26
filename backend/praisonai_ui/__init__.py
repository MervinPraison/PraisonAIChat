"""
PraisonAI UI - Modern AI Agent Chat Interface

This module re-exports all chainlit functionality under the praisonai_ui namespace.
Upstream Chainlit updates are automatically available through this module.

Usage:
    import praisonai_ui as ui

    @ui.on_message
    async def main(message: ui.Message):
        await ui.Message(content="Hello!").send()
"""

# Core imports - explicitly list to avoid triggering optional dependency imports
from chainlit.action import Action
from chainlit.cache import cache
from chainlit.chat_context import chat_context
from chainlit.chat_settings import ChatSettings
from chainlit.context import context
from chainlit.element import (
    Audio,
    CustomElement,
    Dataframe,
    File,
    Image,
    Pdf,
    Plotly,
    Pyplot,
    Task,
    TaskList,
    TaskStatus,
    Text,
    Video,
)
from chainlit.message import (
    AskActionMessage,
    AskElementMessage,
    AskFileMessage,
    AskUserMessage,
    ErrorMessage,
    Message,
)
from chainlit.mode import Mode, ModeOption
from chainlit.sidebar import ElementSidebar
from chainlit.step import Step, step
from chainlit.sync import make_async, run_sync
from chainlit.types import ChatProfile, InputAudioChunk, OutputAudioChunk, Starter
from chainlit.user import PersistedUser, User
from chainlit.user_session import user_session
from chainlit.version import __version__

# Callbacks
from chainlit.callbacks import (
    action_callback,
    author_rename,
    data_layer,
    header_auth_callback,
    oauth_callback,
    on_app_shutdown,
    on_app_startup,
    on_audio_chunk,
    on_audio_end,
    on_audio_start,
    on_chat_end,
    on_chat_resume,
    on_chat_start,
    on_feedback,
    on_logout,
    on_mcp_connect,
    on_mcp_disconnect,
    on_message,
    on_settings_update,
    on_shared_thread_view,
    on_slack_reaction_added,
    on_stop,
    on_window_message,
    password_auth_callback,
    send_window_message,
    set_chat_profiles,
    set_starters,
)

# Input widgets
import chainlit.input_widget as input_widget

# Also expose chainlit module for advanced usage
import chainlit
