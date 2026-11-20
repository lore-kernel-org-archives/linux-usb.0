Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.154.241.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186789;
	b=PPKm0S4ypHpDYugAhcSwvH+bNn1B0T3NzidZYNX+vrey4QL6YAoSd0QSPZPzYIsAl5fq
	 ZMcMsnJOonyJ2Tl0RmWnxLfBQFaQq4R9d4cpTa0IjHXj4S1BvtoQZ31bhTS4GXP454ZOJ
	 ebfCRrQmvsZ9HpRZ5Lg3nUVOVNpbHGwdyEshyFebbrCsEHjlfpEwlM2BmgXCtsMMj+6JD
	 jBmFhYRC9rszK/gVhEcNP9v4PblvhThY2q2Th+PKTWHyg7n8vts681AInh8AOUdsmNoha
	 8goHVnoTXziBmn3H0mr6v6jSlib0pUsu72uneJhdRnj3Dd1UxLD1xwrB4gpEq3JmvMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186789;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=EMS8tjdJy91VNnixiV/o39oR/dKv1RpnyBZ53B5qGVE=;
	b=I1X+bHwa0xSpVIx4goD7vVKYKYyTLOMEwgVZfuzAJKdPx2HxN7ABoV3Hg14CitrE5omi
	 r9BurcGCcTpFX31XQgfTPKCDSZ7R9MF2Zlaxu8TG9ACvjbDSoUiq7CEBRvChoUumh8F4b
	 toSiUDvYvd2PyRk00JPya7MFhOreYa0o6LeD2TE21ppuD//wGKW5KwJTcNcflageMLVlh
	 7cYix7MmNKAsfD8DeC8UQRsuKgIj+ydh2AVFrKZQnXb1sAjpQlQSf+zYhxKrmv4/xSNdx
	 aVw7CXRw03fLIFZvBqGJcqfr2yoKVlEvJU9wNDNYpunOaUwchCRqbCryuZMofVf8jOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=lauterbach.com;
	spf=pass smtp.mailfrom=lauterbach.com;
	arc=none smtp.remote-ip=62.154.241.218
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054C46074D36
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 054C46074D36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id BC5C5232F1C;
	Fri, 20 Nov 2026 15:59:44 +0100 (CET)
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
Subject: [PATCH v2 0/1] usb: gadget: f_fs: Fix synchronous read() behavior
Date: Fri, 20 Nov 2026 15:59:36 +0100
Message-ID: <20261120145937.39772-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
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
X-Bm-Transport-Timestamp: 1795186784826

This 2nd version just changes the commit message.
I agree that the 1st varsion failed to explain the problem correctly.

Unfortunately **depending on the hardware** this patch MIGHT change
behavior for userspace, which is a no-no.
BUT: The behavior for userspace is already dependent on the hardware,
without the patch, so I don't see that as a blocker.

What the patch does is to make sure that userspace always gets
the same (correct?) behavior regardless of hardware.

There still is a border case, what to do with ZLPs (Zero Length Packets):
Userspace read() requests a multiple of MaxPacketSize and USB Host sends
exactly the length userspace requests followed by a ZLP.
It's unclear what to do with this extra ZLP.
OTOH: I already have seen many USB Host controllers, which don't handle
Zero Length Packets correctly, so ZLPs should anyway be avoided at all
costs.

Note: I really would like to get rid of "quirk_ep_out_aligned_size" in
"struct usb_gadget" completely.
But this flag is also used in "drivers/usb/gadget/function/u_ether.c",
and I have no clue about this code and no way to test it.

---
Changes in v2:
- Redo the commit message to try to explain the problem properly.
  Unfortunately this is now a wall of text, but the problem is complicted.

Link to v1: https://lore.kernel.org/linux-usb/20260903153737.58087-1-ingo.rohloff@lauterbach.com/

---
Ingo Rohloff (1):
  usb: gadget: f_fs: Fix synchronous read() behavior

 drivers/usb/gadget/function/f_fs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--
2.55.0

