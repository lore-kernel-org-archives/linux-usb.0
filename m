Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8CD30569F
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292209; cv=none; b=TxvBJXq1fIiXKvQvl8SSk95VzPLQvWwjNWYPE4358fu6m7Hmek//rBCk9XDOk5RvQUlFu5nrV82CrkptSwYgdrHroO7XuSxqoXr4QCWJ6va0W+3crmqzV2o34Lj+bImGuJ+9uqHAjfGLOpizHYZMXvghfuu7GBbtNnCy4Vvmpfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292209; c=relaxed/simple;
	bh=bt11OM5bb6A6fXVXlfO8qiFCEUKqzvv4GjiKScaj1S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GhvxugwkgJYphUaomnfJrVcORXEtbrMZXCcNOlaySMz7WA/Y+4Rz8Uy8IbKTsZbmUuDXJJ0QR3HaOnkTTH0x3k31TOnQ5BeNgscJpB2+GaMjdUs5D8ImlhEMcmXzYWqqjHTNF50MGVHswVXeRCbMeY3Na/ZJYaqAI8SKIl1u/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPujBBgH; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPujBBgH"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c52f96f60so1489443eec.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782292207; x=1782897007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AULKtZqUqAXCrW7SSYMD3oLYHEXTNz504Vn8mZFcNNw=;
        b=sPujBBgHK33/IrF4RHS2d5LjKYsFTer8wLCikevZOpf6U38FJg2FZ4D9NaF44/SzsR
         1hEHvoc6mPkZ0QlOwZE0rBtxB/Xh+8h+of3FzL0hcYYkDpTEnK8cTXMmaO24Yunc7736
         IoSFbFpBe2Nt6A3Zm8B4PFC5TD3lT+BzegLMd212/uHa6ngpHi/7CKvAV1jYFAXEwmzY
         bJPlEcrPJNtXWpmWTUF6pc2kBcsi3rUTauQ/9+IrQ3PZQUPthO/oZ9ur+McPcfTInEUD
         BHenGy5AsI2XKb5I0gPWRgDCjmYmlkQyYqiAjDZvxO4heFSNwu6ajD4N9EUPEfWav4TO
         r4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782292207; x=1782897007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AULKtZqUqAXCrW7SSYMD3oLYHEXTNz504Vn8mZFcNNw=;
        b=k6Y2hyWaFSae5S8GgFshgLJXIrzbJXJIw4KskhPAqKY6iqt5+rworc2qBlEv5Zkv3z
         gJLq7kgJ3Rxgx4GlMw03qkX10bqL3lH6CJ5iyQPmwfn1uNbuL9Pugo10Lxk3DjNmPepp
         RPYwOkT93no46957BADQSfS+IVhwE7LLMCg1VRcAqCt6AXSXGp649KMZeqiRYB0z0Gqf
         WyuX7ulqSS9R7/1nagIxczp/x2BOTbJXBtl4Q0x2YcXBa03M5JgGQwxR0svOlCqV+x0o
         Ox2OI1kBriABv2iUd1Iu2aUvq7ckcmnsTViFoWiSac1KAQsaHCJ/pWN/DlV7haWhSCpD
         Xe9Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro6WXrGP5oo3q9AMEnDPSY04G6k6OSQODBN7vkL0gnvyqqYy0fyrHt5v6GemEvHifbNbQ5F1Vve6Do=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz6fDkFEmM9j39vIdMaZZpP3L5/5DPHb5wgoGbGB+uOr2Nt321
	7zKWZRFU9TVwBIpjwJRFvLaRqhFNVRYUB0c1swqQvTthJwZHWwPjfmKY8cyMfVAfFsSsQ4I9
X-Gm-Gg: AfdE7cnt1TVOzmHgXXFZDgWO3RNlD0p5nEuk9SCwZBXPeqj9xu14CL1njbq/WeDDWwg
	ig5fDVm1kOgOGluU7ULOmRBJ8Yus8fEM0YLCXZtJMgIsT8pXbGTDACU8BCDH1TRwg4z61Pl0NF9
	ROSM7/4I4wxd3SoE7vsA51QWhLc+FwGiKW6iVSjUBZwhq76GOxNS9nbwBeIyX7k39kMjdk0TWIU
	U/GHWalvOklee2r0aBO/uQaHdY7V9Ourib8WMMkgzO7xcQ1+kMLqRMUgbqNnx5DiYZybAP+2nrU
	jBHi/YnxMmfZO+QnJXgN0BrYvSEv9VRIItpEIbGWfMUO9Kz28BHmkw9MkBbIOOyjE7oFQa0zF0e
	YNUnPQpih+ppM7o4IyQVDc7wuSD2MKsKIrOihT9hsEn0MgNPjufxwABtV+I1s+T3Rr0onIJr+ml
	ex7wmTzM94Dp1ZasRfmAfu8ffB5nbdSeYKHfiwZJf1
X-Received: by 2002:a05:7300:80cb:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-30c1dbd18d5mr15967319eec.18.1782292206412;
        Wed, 24 Jun 2026 02:10:06 -0700 (PDT)
Received: from localhost.localdomain ([192.197.201.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5af35cccsm9440207eec.30.2026.06.24.02.10.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 02:10:06 -0700 (PDT)
From: =?UTF-8?q?HE=20WEI=20=28=E3=82=AE=E3=82=AB=E3=82=AF=29?= <skyexpoc@gmail.com>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?HE=20WEI=20=28=E3=82=AE=E3=82=AB=E3=82=AF=29?= <skyexpoc@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: misc: usbio: bound bulk IN response length to the received transfer
Date: Wed, 24 Jun 2026 18:09:52 +0900
Message-ID: <20260624090952.86439-1-skyexpoc@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbio_bulk_msg() copies bpkt_len = le16_to_cpu(bpkt->len) bytes out of
the bulk IN buffer (usbio->rxbuf, allocated with size usbio->rxbuf_len)
into the caller's buffer.  bpkt_len is fully controlled by the device
and is only checked against ibuf_len; ibuf_len in turn is checked
against usbio->txbuf_len, not against rxbuf_len:

	if ((obuf_len > (usbio->txbuf_len - sizeof(*bpkt))) ||
	    (ibuf_len > (usbio->txbuf_len - sizeof(*bpkt))))
		return -EMSGSIZE;

txbuf_len and rxbuf_len are taken independently from the bulk OUT and
bulk IN endpoint wMaxPacketSize in usbio_probe().  A malicious or
malfunctioning device that advertises a large bulk OUT endpoint and a
small bulk IN endpoint (e.g. by claiming one of the quirk-free IDs such
as the Lattice NX33U, 0x2ac1:0x20cb) therefore makes ibuf_len, and
hence the device-supplied bpkt_len, exceed rxbuf_len.  memcpy() then
reads up to txbuf_len - rxbuf_len bytes past the end of the rxbuf slab
object.  The over-read bytes are handed back to the i2c layer and on to
user space through i2c-dev, disclosing adjacent slab memory; with KASAN
this is reported as a slab-out-of-bounds read.

The number of bytes actually received is already known: act equals the
URB actual_length and is bounded by rxbuf_len.  Reject any response
that claims more payload than was received, mirroring the existing
"act < sizeof(*bpkt)" check just above.

The control path (usbio_ctrl_msg()) is not affected: it uses a single
buffer (ctrlbuf) for both directions, so its analogous copy can never
leave the allocation.

Found by code review.  The out-of-bounds read was confirmed under
AddressSanitizer with a faithful userspace model of usbio_bulk_msg()'s
receive path (an rxbuf_len-sized buffer, the same act/ibuf_len/bpkt_len
checks and the memcpy).  A USB raw-gadget + dummy_hcd reproducer is
also available.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: HE WEI (ギカク) <skyexpoc@gmail.com>
---
 drivers/usb/misc/usbio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 02d1e0760f0c..24c4cd0df829 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -344,6 +344,10 @@ int usbio_bulk_msg(struct auxiliary_device *adev, u8 type, u8 cmd, bool last,
 	if (ibuf_len < bpkt_len)
 		return -ENOSPC;
 
+	/* The device must not claim more payload than it actually sent. */
+	if (bpkt_len > act - sizeof(*bpkt))
+		return -EPROTO;
+
 	memcpy(ibuf, bpkt->data, bpkt_len);
 
 	return bpkt_len;
-- 
2.54.0

