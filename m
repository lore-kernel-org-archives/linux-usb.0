Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186789;
	b=o7j6kFKyl/VHklM4eopU4bYPySUaHmvC4GbiLIdfi0NjKnz3UwFQkHb1t3wWohoBlQZG
	 GdQHaXGj5ixjPvgTjotTDA3RsBx1hV4NehLSTCEXtr2OywSDFAxptg+ipQaTcpY6SYTga
	 aPXdM0UHAUdCFmnzpmSsa9Ua/hLmjJqBvNkVbivIkLgU24sz5bIskfHOpAGTb2phg3aYz
	 RECMS9jVuMdxyGP6XBfQbBPLBbEPDYLTR/9V1GZp5cxuU9wQxRUm/Jzoozd+K4eOZVouv
	 TxKz04TUUbhRPLqUO/CVfwVO+caC3lZ3w+WEeHPvog5vvcHnQoeOz9QxqPaiA8iQnbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186789;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=RrZMaonV+xFO/D4n22qyma6iV2qAwo5prrIiQAkf9Pw=;
	b=c9JW8d2hbn5JtQxXOjCZQUUWsEnMGnkOAfCIfXrPy77ku6hodQWhxmoUTINuOFF2ajaE
	 70v+L8qy7dpe8uioeRPjzNvC+cwhLizVdkrBiLFy0vw41M1jcL9ZfF3VCQwerouinsfMY
	 R82FjJ0gjBSN3A23CdEvZUhMithzhVWfjVgo8PT2oTE9nh4yhBS17CI4hoE8MaB/zhur/
	 ab4WhqknRD1QZoA211Gqi6WK3ml1NDSJn6T0GfwyYQeeYpLsWQ2UlydQbE2ESbDff5PF6
	 ZuQM36OczBRb2RxnqdJ5Bd1pS6jCrihNtimSLB2uWRl6bxUWTX+dLe149/4mJEjeLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217E6074D37
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2217E6074D37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 69C61120E5D5;
	Fri, 20 Nov 2026 15:59:46 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	nuno.sa@analog.com,
	michael.bommarito@gmail.com,
	prostitisgabriel@gmail.com,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 1/1] usb: gadget: f_fs: Fix synchronous read() behavior
Date: Fri, 20 Nov 2026 15:59:37 +0100
Message-ID: <20261120145937.39772-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120145937.39772-1-ingo.rohloff@lauterbach.com>
References: <20261120145937.39772-1-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1795186786483

Some UDCs (USB Device Controllers) require, that USB OUT requests (host ->
device), have a size which is a multiple of the USB OUT Endpoint
MaxPacketSize.

If this is the case, then the flag "quirk_ep_out_aligned_size" in
"struct usb_gadget" is set.

The current implementation in "f_fs.c" for synchronous reads, behaves
differently for UDCs which have this flag set to UDCs which have this flag
NOT set, because ffs_epfile_io() uses usb_ep_align_maybe() and this
function then aligns the request size if the flag is set.

Example:
Userspace executes a read() with 128 bytes.  For a HighSpeed OUT transfer
(MaxPacketSize == 512), usb_ep_align_maybe() transforms this into a 512
byte request if quirk_ep_out_aligned_size is set.

The Host sends an OUT transfer with 264 bytes (136 bytes more than
userspace requested).  These extra 136 bytes are buffered in
"__ffs_epfile_read_data()" and returned for the next userspace read via
"__ffs_epfile_read_buffered()"

If "quirk_ep_out_aligned_size" is NOT set, then "ffs_epfile_io()" passes
the userspace read without modification to the UDC; so in this case the
UDC starts a 128 byte OUT request.

When the Host now sends an OUT transfer with 264 bytes, it's unclear what
happens, because this completely depends on the behavior of the UDC and
the UDC driver implementation.
Likely the extra data received from the Host gets just thrown away;
that's for example what the DWC3 UDC driver does.

So the behavior of an UDC, which sets "quirk_ep_out_aligned_size" is
different from the behavior of an UDC, which doesn't set this flag.

The first behavior is what userspace expects (no data should get thrown
away). This patch enforces the first behavior (code buffers extra data),
by **always** aligning the USB OUT request size to the Endpoints
MaxPacketSize.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..53c92d149845 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1078,11 +1078,12 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		}
 		data_len = iov_iter_count(&io_data->data);
 		/*
-		 * Controller may require buffer size to be aligned to
-		 * maxpacketsize of an out endpoint.
+		 * To expose a stream like interface for read(), make sure
+		 * the enqueued read request is a multiple of the maxpacketsize
+		 * of an out endpoint.
 		 */
 		if (io_data->read)
-			data_len = usb_ep_align_maybe(gadget, ep->ep, data_len);
+			data_len = usb_ep_align(ep->ep, data_len);

 		io_data->use_sg = gadget->sg_supported && data_len > PAGE_SIZE;
 		spin_unlock_irq(&epfile->ffs->eps_lock);
--
2.55.0

