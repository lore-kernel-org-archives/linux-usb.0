Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF14A1393;
	Wed, 13 May 2026 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687571; cv=none; b=OLf/RsvA+U+mC2I6NqSqRb2ynGJ+4tp/v0ng1HObQ7b3s3al/X6JXirPx7/HG7Fs6HN8v9bfNcGZlZ+zOVON0ZbrtMaRr+fXldOk4p/w4f/V209oVxA0l/3XJApDYEK3lAMGS0tB+AOyFi7drBSlf68SGa+zGYA+qmaGBxdBLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687571; c=relaxed/simple;
	bh=TQGYx9tV/qbPtt5vfAgvV49UdYNB0mdmVEcUsQhaHKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGHo8xBAtdn6XISb3AO/8A5OxFKwdeovYyl476LuSB+1m6OFSmuQx9EjaypiqdFsWXm6XAL5HjBRgPWDkupfIZDxK7/YwOsKTgdfzOuj35vH1H3h0QIkVdCn0hQoLvMWv69Q9ld3JFVwqOb9+GwlNavZwAHSOib88JDNn17/XRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jcaJoWBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jcaJoWBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60664C2BCC6;
	Wed, 13 May 2026 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687570;
	bh=TQGYx9tV/qbPtt5vfAgvV49UdYNB0mdmVEcUsQhaHKs=;
	h=From:To:Cc:Subject:Date:From;
	b=jcaJoWBLLJqft4XHdVa0btLbuhFk696Bvx60y6iCSpz9c12tQnIBXP3v/AmDzST3x
	 3IkcxxeIkaA3GDvv3qi8AkEGpUIlJg7A1g4To744paoGp0gnbCPMWXLg9E2i+MKLQg
	 UFY5pq1BH4mMi37tdg2wuOTnTcE3V8drJiJrxUuU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable <stable@kernel.org>
Subject: [PATCH 1/8] usb: typec: wcove: don't write past struct pd_message in wcove_read_rx_buffer()
Date: Wed, 13 May 2026 17:52:48 +0200
Message-ID: <2026051347-clustered-deflected-9543@gregkh>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2858; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=TQGYx9tV/qbPtt5vfAgvV49UdYNB0mdmVEcUsQhaHKs=; b=owGbwMvMwCRo6H6F97bub03G02pJDFks8wI2FcwpktC26Ob23uZQF/dP5+9lzvevrW3c7P2MW jcvcDncEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABPRMGGYK7hQPtv66SKzqQab PZt/v5mjpviig2F+nu3RfY+0xcx0P+U997XW2yBf+PgbAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

wcove_read_rx_buffer() copies the PD RX FIFO into the caller's
struct pd_message with

	for (i = 0; i < USBC_RXINFO_RXBYTES(info); i++)
		regmap_read(wcove->regmap, USBC_RX_DATA + i, msg + i);

which has two problems:

USBC_RXINFO_RXBYTES() is a 5-bit field (max 31) while struct pd_message
is 30 bytes (__le16 header + __le32 payload[PD_MAX_PAYLOAD], packed).
The byte count latched in RXINFO is the number of bytes the port partner
put on the wire, so a malicious partner that transmits a 31-byte frame
can drive the loop one byte past the destination if the WCOVE BMC
receiver does not enforce the PD object-count limit in hardware. The
existing FIXME flagged this as unverified.

Independently, regmap_read() takes an unsigned int * and stores a full
unsigned int at the destination. Passing the byte pointer msg + i means
each iteration writes four bytes; the high three are zero (val_bits is
8) and are normally overwritten by the next iteration, but the final
iteration's high bytes are not. With RXBYTES == 30 the i == 29 iteration
already writes three zero bytes past msg, which sits on the IRQ thread's
stack in wcove_typec_irq().

Clamp the loop to sizeof(struct pd_message) and read each register into
a local before storing only its low byte, so the copy can never exceed
the destination regardless of what RXINFO reports.

Assisted-by: gkh_clanker_t1000
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/wcove.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
index 759c982bb16a..0e5a3e277c3e 100644
--- a/drivers/usb/typec/tcpm/wcove.c
+++ b/drivers/usb/typec/tcpm/wcove.c
@@ -444,9 +444,11 @@ static int wcove_start_toggling(struct tcpc_dev *tcpc,
 	return regmap_write(wcove->regmap, USBC_CONTROL1, usbc_ctrl);
 }
 
-static int wcove_read_rx_buffer(struct wcove_typec *wcove, void *msg)
+static int wcove_read_rx_buffer(struct wcove_typec *wcove,
+				struct pd_message *msg)
 {
-	unsigned int info;
+	unsigned int info, val, len;
+	u8 *buf = (u8 *)msg;
 	int ret;
 	int i;
 
@@ -454,12 +456,13 @@ static int wcove_read_rx_buffer(struct wcove_typec *wcove, void *msg)
 	if (ret)
 		return ret;
 
-	/* FIXME: Check that USBC_RXINFO_RXBYTES(info) matches the header */
+	len = min(USBC_RXINFO_RXBYTES(info), sizeof(*msg));
 
-	for (i = 0; i < USBC_RXINFO_RXBYTES(info); i++) {
-		ret = regmap_read(wcove->regmap, USBC_RX_DATA + i, msg + i);
+	for (i = 0; i < len; i++) {
+		ret = regmap_read(wcove->regmap, USBC_RX_DATA + i, &val);
 		if (ret)
 			return ret;
+		buf[i] = val;
 	}
 
 	return regmap_write(wcove->regmap, USBC_RXSTATUS,
-- 
2.54.0

