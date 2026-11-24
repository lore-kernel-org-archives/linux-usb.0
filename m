Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509713;
	b=3RWaQ2+FIrRRLIIAMO0Qo8UnV+BjbwZF3dAip1VMO+tWcfk9yLoeI6c9z8AQobWYhHDw
	 GkiRO3UxhlOLplycteoKc4X2xojMKzamlk8LHfkYq2H/mrrxWko1WRjnHP9YvTRzOnidS
	 ixFduYz+S+kwZyskNkmchUO+tOJVTXNplGb+PmLDfWfPglqr6rlSKPGqMvsUEw44hffd1
	 t2AZGhejLwn7Hn7Vx0LzT3Kl1LMO5yKQKA2S7gG0z1heoxq/XQt1z7caqqkVERq34lXSc
	 wSKDNBIAZM2J1vh6qCR2iipn4UwBWMpiYn20FutXmC9FgfSJqU7/G+7qQpSA1EyOuIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Dw9tl48yoYuBnTJQlsrtHR1Sj3M6jDxOml0OHKzmMmQ=;
	b=FD6Ej/fYGeufgwKp0kM0ayL4AqL4UJG+3kR65uq/FdHp4bCZYd0hswMs+qCmqIhNOkLo
	 OITNWBmFYGz1K2DtNRZZ1sSKodh4Zc3tkK64TjxvFJM3m+LF8Dj/5kgbnagJS9G4BY3IK
	 o+1zfgtdLRNMB6kmTx3OatdDi50qt+hKHShob2OYKqN7f/VZyGxOcm9bbt+3w0iWmkgBs
	 Qxjyea+Nqmr841FuBd3RE4e0w1enBDnOX6ZqwI12z/Qx8Lmvp33LyL5SSYNjwNYPHdhND
	 7yi0uDVQ/VX0Kh5sYEzsQdqAKUTh1fLe1Ebznli5iY9P7RwGkpwfOr6lAE+yidZkIaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xR2IHuM7;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C40606A327
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C40606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xR2IHuM7
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so38711755e9.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509711; x=1796114511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dw9tl48yoYuBnTJQlsrtHR1Sj3M6jDxOml0OHKzmMmQ=;
        b=xR2IHuM7Dci9zVepmivAR8zmfh+9xthP2PH/PYcNQIFb4THFbkM1dE51kyoVu5a4Wq
         qpMpjIc02ZMaqUsBniDjp9Wsr2Bpt3muRX6Gkx8Yi8E9wQO9T1/0s6E77SFlTRKKHxKl
         BISgpg0TUS7UHSkwydZuSrvIkEhDBAX+yXrGHRLUSqo8gMWWg0TqI+u0GPSnySOlIRwa
         7WZMLE9lY7O0DXXP3OXO/svK3SCAc6GJ2LcBGjEm0BRjgtH/7n4OQ++NMM9p54Rn7ntl
         hmTwCpFLUD2AN5Pcn5Nale6CckiorHWysgQx7b8KlpQ+zqO6vXTceiwyutY6usTdaiHd
         Y6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509711; x=1796114511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dw9tl48yoYuBnTJQlsrtHR1Sj3M6jDxOml0OHKzmMmQ=;
        b=CiY293XLKpIQ1i9VmDco7GbgwID6cHps23yoOlBpUmuI4lITRITZusJuKNwh36AP4W
         fjzotzaPjwgfkAC/Hset7AgxiRPr/sTZAUMul7WVfMLs4TcMsuY4or8KzPAB0owHTCRL
         Kta1Vru7er5qFTga0ThOI4zstV2dgp9cCI0+v9IfyDUeKdtK7gLCReiwtnaiY7uHI5c8
         XL7KaUxokJoWr33UeImZJem8GoOZ4+ZPJd7AxUgB9f0+pocIARG5cO3VxM3BxyU2alcf
         iPK1M/j7CRkO23PREFcjCx9x6KbC31hdL/f6paoVq2Q0s2A2o4JVBnqtO/UPRRsXnj7j
         CoTA==
X-Gm-Message-State: APuU4Z/4z7ICjPHHZBbP1r4i9fXkj7uqbgQueubanlGrZIVRxqUI2Y9s
	EN8GHngEfEU8Labh8+zggODAaqksE64OkC4aNxvciEs5hos02LJa4DRnNqk0G7wPokA=
X-Gm-Gg: AZFdTZct/OX9la7JjJlG6U7pcitRT5rBX/OLGnFaXjOuN+R9BlG6UW2WwhRAq6wQbRu
	Br1lzukcToF/qbLWJEjoKcJqtG0WwEez5SmRbM2TGNHLDSgV4QpIVcrB3E7+46W2xJTp5Z5Uaco
	X4Vf69xEU+8PD1iPU6ce/lSASzSQlgmAR1NdTBEQLpDj/6QZVOOK8KMEPn3H69FAIYqvtnsHoDe
	9YQMuCkA1NBf6sSGsOMo5qx3R7Jx+RpKVpbv1FtaPYlr7S9C2x+RdQzf1AofWrrV940MPKvBjL7
	CVSkRR4ruLn+rmcXLsUIs4WkIhVCdLoXuysMORyOgMXxSqPpeTAWIGXppzduADnS519zM1sGIQZ
	We058WH8wOAWLWDhNCt8OmIsXZKJP+uwDdG9QpK3gbuPdEUwxCBM6Agasggn1vXwXkj1C6DNevA
	wsJzccH98ZOUwMDqmbM7kgIvPiYIym3S9wNRS/0ypV14E4Q+5v7D52cb/fVuIho18h8RB04MI6M
	RVa0cRhAaXb2NJwXVUpqjVlLNv7MF7X41LtNofzPo7HeIMv+VM20WTrg9PY9Y0LGd4G1ldauXNK
	yIyZW5dp7UuSjLTuj0Xf94oz3n8sm6+cp2+FMPfh/aP9Wb7D/wihq7SvLw==
X-Received: by 2002:a05:600c:820e:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4bb887c9f5cmr280231455e9.1.1795509711073;
        Tue, 24 Nov 2026 00:41:51 -0800 (PST)
Received: from adriano ([148.69.80.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm369951895e9.2.2026.11.24.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:41:50 -0800 (PST)
From: Adriano Cordova <adrianox@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com,
	Adriano Cordova <adrianox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: inode: fix use-after-free of struct ep_data
Date: Tue, 24 Nov 2026 05:41:44 -0300
Message-ID: <20261124084144.3208824-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
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

gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data via
put_ep(), but the inode still points at that ep_data through ->i_private
with no reference of its own.  A concurrent openat() on an endpoint file
can therefore reach ep_open() and dereference the freed ep_data (the
mutex fast path), even while the inode outlives it.

Give the inode its own reference: take get_ep() when the endpoint inode
is created and drop it again from a new gadgetfs_evict_inode(), so an
ep_data can never be freed while any inode still points at it.  This is
also safe against dcache pruning, since the inode reference keeps the
count >= 1 until the endpoint is removed from dev->epfiles.

The inode now holds ep_data for its whole lifetime, so an open() racing
with an unbind never dereferences freed ep_data.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes in v3:
- Add a Fixes: tag.
- Add Cc: stable.
- v1: https://lore.kernel.org/all/20260904163827.216389-1-adrianox@gmail.com/

 drivers/usb/gadget/legacy/inode.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index cc059a6ee262..20453214e35e 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1748,6 +1748,8 @@ static int activate_ep_files (struct dev_data *dev)
 		if (!data->req)
 			goto enomem1;
 
+		/* The inode keeps this ep_data alive via ->i_private. */
+		get_ep(data);
 		err = gadgetfs_create_file (dev->sb, data->name,
 				data, &ep_io_operations);
 		if (err)
@@ -2138,9 +2140,20 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 	return 0;
 }
 
+static void gadgetfs_evict_inode(struct inode *inode)
+{
+	/* EP inodes hold the reference on their ep_data via ->i_private. */
+	if (inode->i_fop == &ep_io_operations)
+		put_ep(inode->i_private);
+
+	truncate_inode_pages_final(&inode->i_data);
+	clear_inode(inode);
+}
+
 static const struct super_operations gadget_fs_operations = {
 	.statfs =	simple_statfs,
 	.drop_inode =	inode_just_drop,
+	.evict_inode =	gadgetfs_evict_inode,
 };
 
 static int
-- 
2.51.0

