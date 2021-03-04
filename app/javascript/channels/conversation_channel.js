import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  const chatText = document.getElementById('chat-text');
  chatText.scrollIntoView();
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        chatText.scrollIntoView()
      },
    });
  }
}

export { initConversationCable };
