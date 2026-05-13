Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671DF3451DA;
	Wed, 13 May 2026 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687576; cv=none; b=IIGcSlRnV83eAg+yjgMfbOAXiJA8XBZBssF1EMDR6F2iqGoEzIOV87FSP57Akmq1n+tI8eUyciBFnVrgFlnQ1KGHGVweRhVu2Rr5BZWVlAMlmYVqTaAJiTCwDtzBcTZS//m58r0j/TwXbIxxRrkGDRUo8Cdbq0NlvSjTcZPp2A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687576; c=relaxed/simple;
	bh=moU8iqUXdpb/eQQ9vWS7P2JsZRIbxeNcmIXcVdomkCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooqSLAZIOImwKXZM9XdKN8ZkNzsg+F22m9in+Zor9qr/2VEEGvfmwxsf/tttJwzUz57VfvBBzLwL4GOTPq9c6SzZVe8K7KgKzi74aFQ3DznueKoeQCPW0kPxwvOdcLa69PPYJPtF6OFLOdNMgdNYcFBMnV9ufgSBBq5wpVrJSYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q+ifhpb/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q+ifhpb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2C5C2BCF5;
	Wed, 13 May 2026 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687576;
	bh=moU8iqUXdpb/eQQ9vWS7P2JsZRIbxeNcmIXcVdomkCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q+ifhpb/m3EEaubOsjJFojsnK82BMV8KnkRrQpSw8xDvs8owbJJDqhM1hfGeQ15jT
	 Yg5TeqkwoMG6nO6bTD5xWT5oPadTj2Nua7/qGkicQZphOyutHgG5nVTrg8jvAXqxNY
	 9eV22by0NRLhm7YTUsg6iti0Ote4BbQ3fj/JTmhI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	stable <stable@kernel.org>
Subject: [PATCH 3/8] usb: typec: tcpm/tcpci_maxim: validate header NDO against RX_BYTE_CNT
Date: Wed, 13 May 2026 17:52:50 +0200
Message-ID: <2026051350-sitter-canopener-9045@gregkh>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=moU8iqUXdpb/eQQ9vWS7P2JsZRIbxeNcmIXcVdomkCo=; b=owGbwMvMwCRo6H6F97bub03G02pJDFks84KOBrYUC3775h0y5xmn2eZDTxmT+7+mu8iLxesbL M6d62jTEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABMpqWWYZ8g+13SP97JHB+8U f32xM8pIW97KkGHBllyXxWpnSlR6ogoEnX9Vhfz+xfoDAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

A broken/malicious port can transmit a CRC-valid frame whose header
advertises up to seven data objects but whose body carries fewer than
that.  Check for this, and rightfully reject the message, instead of
reading from uninitialized stack memory.

Assisted-by: gkh_clanker_t1000
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "André Draszik" <andre.draszik@linaro.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: Amit Sunil Dhamne <amitsd@google.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index c0ee7e6959ed..7324139d51c8 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -181,6 +181,15 @@ static void process_rx(struct max_tcpci_chip *chip, u16 status)
 	rx_buf_ptr = rx_buf + TCPC_RECEIVE_BUFFER_RX_BYTE_BUF_OFFSET;
 	msg.header = cpu_to_le16(*(u16 *)rx_buf_ptr);
 	rx_buf_ptr = rx_buf_ptr + sizeof(msg.header);
+
+	if (count < TCPC_RECEIVE_BUFFER_RX_BYTE_BUF_OFFSET + sizeof(msg.header) +
+		    pd_header_cnt_le(msg.header) * sizeof(msg.payload[0])) {
+		max_tcpci_write16(chip, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
+		dev_err(chip->dev, "Invalid TCPC_RX_BYTE_CNT %d for header cnt %d\n",
+			count, pd_header_cnt_le(msg.header));
+		return;
+	}
+
 	for (payload_index = 0; payload_index < pd_header_cnt_le(msg.header); payload_index++,
 	     rx_buf_ptr += sizeof(msg.payload[0]))
 		msg.payload[payload_index] = cpu_to_le32(*(u32 *)rx_buf_ptr);
-- 
2.54.0

