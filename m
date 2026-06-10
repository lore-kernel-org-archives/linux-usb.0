Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09C40862C;
	Wed, 10 Jun 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097768; cv=none; b=FawCaDaf2hn/eZX41e7seBcKZR1c100q8zuibKCh114fuSj7ZiKRpWjk46mLht/hC1JO2JMJJZCO5QS1Ye/hOtv6dN4FdOaPpFXO/SCukDiWOhxDaVxXSyldHo1uD4af5GPMjXI3R8JwWRTaMGCcoF3cc7A0ZwoU88Se3Jm8qwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097768; c=relaxed/simple;
	bh=9DWuvdyWfLsGn+dx+PprUQpKSjZwxXb7DNLxi08MAbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upsOH5K/S+2HzDtBaHYJXuk9MT/NUrHsh2WWiRGz9emG7i2+DZRaVAJeIzIpWvHGXjSzyodk05WiGMK74GbT8yBl7290C+giXwxu09x7jTA3CfHHk3vuX7/YJalg76tDaxlTUCyHKcRuGTaTdlkfcGiEWx7yR9+QzPgk3Jgn/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiuhscD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiuhscD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815361F0089F;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=F4lGwcAOS1Zvwa3XpO9r4t8cai8sV8i7d08Ft2Bo6s8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CiuhscD1WZagujomQT2tMSXC7yit7B8NMcn5fGqd6IDHQJMtG0+PfbvBxKvysaHgd
	 b7n6D2PT3UZRb/AIZGL3Ofi3X+1I6RIkeEzvPnQ7il9J51zMNRZIj5PPlsx4n839T5
	 ypf7ZRyNVzqK5Ww1EbtuTNCEwSl2Gy26Quu/RvYWxzfUKOvEbDe4vRk9XFQf+Dpe5j
	 DGUZKNv9Tr7FIFQmh9OfEy/VfUQFn7RKNr1hhY8KkTUDnsm31ossikY7unQNJr5TQn
	 380cCJhyj+/VxWdn8LJ+lMMAPFaGqD3U7GGFGRtMkOAL3TRU2jfbmGjjKMVUkTf7Hi
	 3nUjsmENU3wAA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001UfL-1rs3;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] USB: serial: digi_acceleport: clean up inb command submission
Date: Wed, 10 Jun 2026 15:22:32 +0200
Message-ID: <20260610132232.356139-12-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610132232.356139-1-johan@kernel.org>
References: <20260610132232.356139-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the inb command handling a bit by removing an unnecessary line
break and moving the assignment operator before breaking another long
expression.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 9fcb53eb82d8..2b755b328fe6 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -453,11 +453,10 @@ static int digi_write_inb_command(struct usb_serial_port *port,
 		if (priv->dp_out_buf_len > 0) {
 			data[0] = DIGI_CMD_SEND_DATA;
 			data[1] = priv->dp_out_buf_len;
-			memcpy(data + 2, priv->dp_out_buf,
-				priv->dp_out_buf_len);
+			memcpy(data + 2, priv->dp_out_buf, priv->dp_out_buf_len);
 			memcpy(data + 2 + priv->dp_out_buf_len, buf, len);
-			port->write_urb->transfer_buffer_length
-				= priv->dp_out_buf_len + 2 + len;
+			port->write_urb->transfer_buffer_length =
+					priv->dp_out_buf_len + 2 + len;
 		} else {
 			memcpy(data, buf, len);
 			port->write_urb->transfer_buffer_length = len;
-- 
2.53.0

