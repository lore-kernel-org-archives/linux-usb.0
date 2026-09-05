Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4134BA50
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619766; cv=none; b=odkwClKa+Z4+Am3mNB/0yUvJx3mKEXLfGQn4wjeQFLqJf+snV309kggUixU0ZpXZqXmQEsbHiCZ1c6Ly44VuJntVyWUlR9j8as1Tl0/Up/EC/lKsOI60kVYtYAtm2nNXkRY3TxCmc1/ppidzH9ZqV7LF8dGGscpEatkAE2Qq6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619766; c=relaxed/simple;
	bh=FRnnV2UPgnybdy2i+KaN7uxF++IrB+3e+PRN1h8J4vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLTYzKprgkSqpOVbhN0lwXsqGM0duoyiYzUHPQaJmyKASMupJeoSfkAnIo9CHgX1f73j4CMtjwtOs0GLDwQdHo9wNZpKojcl9qz8v71907weoY+jqAjaqYD8nrZHYkmTC8wBJHiQWjELlqTFity79ZETgtv2N1i5eobHMAUrsfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/bfgNbm; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/bfgNbm"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66f78cba2e1so2098362d50.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 07:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788619764; x=1789224564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WX7DvNOjHryO47q3I+QxvLickoY+HKmF72l/Zrc0jQ=;
        b=L/bfgNbmABPzPhf50WwDG07fcT71kUAZzTjKBdXfogcCsPPpFGdYSAFmZhaZNNLL79
         Z7C81C8PMzSgchrh9fZDNhprbHVob5De3h8kCLRyAujaH90dssNtGX0DUYbNr8xcu9JM
         ZFhAGsXECmSfmSMOXOropCnedNolL/JPzeHPAW1wWNhe7FFCrxNZduYc/sLAhw3FMewE
         N7WvNtLu/pzh/zrcQQvuVb0xSQ3F2R1n847Su6fJfrUxsvxm2IpSZuzkCgHtUcFZa+a0
         +SI98mQY6oqaIKBtxSOiH9XFCKkupwnnUWanHMS47yIviRRincbvY899oKHCSKO+CjBF
         SW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619764; x=1789224564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WX7DvNOjHryO47q3I+QxvLickoY+HKmF72l/Zrc0jQ=;
        b=h9K/bQnOw/BjrIxA0bj0hyoGugB9u2LErC+U431VLm10IpC4fTtnbnO+ztYP75MOsg
         Zp+o0CFRUDuBysOl3CBmv0ASwqWdq33Eo3M2dxENQpcjNNjpXPtDzrwvzlOoL11LN0Zo
         jQ+27oNVxfG8ACkL1QTrbl5Gde1TTrLjdTq7/UYjfFkvTOwXY7KbB0eQbSw3n5uNMc6s
         qJDtOkSF/QwGMmsrRmfgGA+X6W2WtZrlm5oIOCEFmtrCtUrj/EyfcXLzTvGyaB7OVHmG
         anzO94zB21YZmi1bjkdthE5K0cOVtuXlQfL6UIZ9SRrd7Fa3KBjkZ3kp3Ybo+eIn4Fkj
         q0/g==
X-Gm-Message-State: AFuF++mUZZYk16KUeVsGTCPgitXwdRqt/GG27bPgSpK/HxapVyuFBoLK
	B13Q/eg4YTeJwu9H4FNj0Rf8zaFJKS7LLZnEnaUe8RcIJmXe83C+rdJvXmZ3YA==
X-Gm-Gg: AYBFou1UAPga/1KA5xyNXifEF2qvPkc9s68URVUiICD/Bw+G2H3sVphIKdghPaROKlv
	6+a3/SCwz7Y5g2e3aMUNUk5ZZ6PJL9P53K5OE+IKdAr6/HsVd0OTE3rKWJPE1DuxSzUuvHB4hJE
	lli0k1lRxE+ZbRNWQ+75vvFws4Ei5mHiW4gSAJMVqhf0v/QIyFeByvqh764YxekBGBJJUR66U4d
	tOXFtF90RxLG1dYDt4zT76Oy3YAJeUgXVDmBUH+F0OaQoWjV5Bn7Em2Z07GZ85TR5vzXyX5GS5o
	gvJgOdT4L9hknLpoLk9g5kekSjO2ZF4HhOG/wFzPdTleSdyGY4bCJ+4hqjvDga84j9ThJLg9M+S
	d8BLbmvF+ZisWAEuz8H7T67yeg3A+77rlglfLmrkO8WNPEsv4JETCVBSNkTKZDcE354iJ62EdUU
	ufaijZo0SSbg46OBg8cjTylPjKrZLqQmZD8DmAtnYc3SxbzQ4I4FU6ug==
X-Received: by 2002:a53:c052:0:20b0:66f:c1be:a664 with SMTP id 956f58d0204a3-66fc1beae72mr1465739d50.86.1788619763684;
        Sat, 05 Sep 2026 07:49:23 -0700 (PDT)
Received: from adriano ([186.174.254.32])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb497cf0dsm4616706d50.21.2026.09.05.07.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:49:23 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: inode: fix use-after-free of struct ep_data
Date: Sat,  5 Sep 2026 10:49:05 -0400
Message-ID: <20260905144905.263941-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
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

Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes in v2:
- v1: https://lore.kernel.org/all/20260904163827.216389-1-adrianox@gmail.com/
- Added further explanation in commit message.

 drivers/usb/gadget/legacy/inode.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index db961aaa3740..089fa7119922 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1626,6 +1626,8 @@ static int activate_ep_files (struct dev_data *dev)
 		if (!data->req)
 			goto enomem1;
 
+		/* The inode keeps this ep_data alive via ->i_private. */
+		get_ep(data);
 		err = gadgetfs_create_file (dev->sb, data->name,
 				data, &ep_io_operations);
 		if (err)
@@ -2015,9 +2017,20 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
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

