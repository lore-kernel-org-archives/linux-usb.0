Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C43D3D18
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 03:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025570; cv=none; b=JDzqQWyOuV5FkavGxIiC43Z37ewKf6zf7JuhA/+Kfys32vuNSR6noX0eE8ucPCzYupNcpoPXL6NMWhsyqzs1b/cYzVphjxZzYLdj4XGrgUkE9ZcLjkXlbDbMQTuPMyE1o05CeSX9WioU4X89NB0mgluUzeP8pwigecr/7nwfQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025570; c=relaxed/simple;
	bh=E0fATSG/nzGiqE76k6QJzFgiaNu4qeaMIc3wFF7Gi4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dpC23wNb32JAjAvPQQlltvFZHUTp70EsqpZdD1TGQ479zduRzk/Sy6NLw2ChUiS16JNs/8mK6Qi+bC7jj+v8afm9ka0Z3i0bormM9vq5WetWD3oDkq2SqPLy4JFZgP7LQBNp6rriS7ftFBtqph0fnVsrsm0nKH+BbV7IX8zfkeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQV5r3xn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQV5r3xn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d0407aedd6so51087885ad.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787025568; x=1787630368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jANj+rRs676FGfXiCbtyRb/0kLIKRey+NQsOgHVTV8A=;
        b=OQV5r3xnZLaEeYLujBkOoJifhIemBhKspqoSkg5Ppg8Ofj1lrgGv9WnoE1mJ4XV6eK
         21kTbr8gr5Hi0UKj1FjwLA5GXITpBK8Sn1YifXjC/Olv29sde4BFCgkDGiIUckE+WWP/
         xgoDbvtubNFXKYEwdqQDGIs/QEyMkWcMJ7lDmCVHOWQopRFpFCFMYXzOQGmMISn+XksX
         rRqYskG0qvSQO/DifmhtUwbB3gBSWM8S5T3KkfUTW50mGGVPbiOFp+GkMmmp3Klj7mZp
         FRe5hY9makhWc67H/0xk7apHPBNCqvdb1BpFqXsJK57wa3C6qxyR5/El9nszexd+FRu7
         M7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787025568; x=1787630368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jANj+rRs676FGfXiCbtyRb/0kLIKRey+NQsOgHVTV8A=;
        b=MrdRKkixR8J/Ko2UFWjYk8mQjDZhnDcCoVJjQ9OiN58Ggao6PXr+t9UYgoQSwRBL3U
         MFHj24T+Ri/SEHN0IQC1n2EMy04jjo9z0g0HxHc/4AY947WzZUR98rEoTErkd7SyHtbw
         +qoLi8jXNTVKXoJ3Wk105JSnS6ciSeaHft7LBltPQ4gSWtarpUkLXvhubOjWSMkrvufQ
         vb7JA6+h5LRJ+Y5KrJfcJ8rMWqYv6zrA7B+wyrmxwn2gHNyJ+1W0Fz1RRC8fRzZydVj9
         56Y0SvCki22sbr4R5HVpvHbyihxa+RRGjZ5dK8ardhGPSZaiYk0Rv9eXCwL1Tqifnc7g
         4GXw==
X-Forwarded-Encrypted: i=1; AHgh+RoKHhQWn56PT0QXvbKk1lo3DOhG9uOPyIs/e8WVfrLnT12IFsFAwEXGcXK6+WTC6zKes05AkbJOEPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcR0+02idSLtP+73MN8jmscWjV6cmAi7MQLE1ZPsaXomQgrLC
	taC/tPvB+UAmLF/fWQeEdOwRk6+Y19+PbPH7B4LUpa4dGTIQ8ryM35yn
X-Gm-Gg: AR+sD13LTRFn0ezYL2dD5J3ATWi+uEGHgMzL2/EAzxmuYp9v1TTfd6BY3zYhaK/xFYq
	vNGqIZoYJPfV1nRUeVHEswkOIpFtYeZN8kAlxG43TX5/r92gRrYWnOEn5Ph1d+b7jCsL5Z+cRZq
	c/r9fvmwaTYc8HE7791oMAjwH5pz423ciW062i1Zpqn2w6R+7GTqwl7xWjxUTwpvho2+UatAYw9
	cLRgjBHaZGEmkvOi2HtWnw0S3BAALh8D1cZqD/Xf4tMb6LQqQcTcu6tFLsx7jycUb+lNVRY2Ikp
	US7WoFRRhD6DGvWaaP7/eX2+vZBj9K2ewy11GCaEYymrFc9ODAjUJ3lI2yJiQL8q4mQy4TdG5vS
	JvKXC8eGX6mwBwDub1Rk6CK3Imaf/IR0hR+Ps1eg6z6Dckf1eVdXwsQUUUf4n2dmwPIUJGzPHs9
	huYVZ6j1qVrtNpXl4GUOpnOlBadyJ3LXSAPnrDXulkxF6bz+2HRvUdOyjK/cwpR91UGLwjiGfdP
	kw=
X-Received: by 2002:a17:902:f688:b0:2d5:cb05:49d9 with SMTP id d9443c01a7336-2d5cb054fbdmr45434345ad.5.1787025567552;
        Mon, 17 Aug 2026 20:59:27 -0700 (PDT)
Received: from Default ([2409:40f4:1036:ea4:2b52:6050:3690:cbce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd22f7sm17761341eec.1.2026.08.17.20.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:59:27 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	festevam@gmail.com,
	jeffinphilip14@gmail.com,
	eeodqql09@gmail.com,
	kees@kernel.org,
	felipe.balbi@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
Date: Tue, 18 Aug 2026 09:29:04 +0530
Message-ID: <20260818035904.10324-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously fsg_num_buffers_validate() was removed as it was not
necessary due to Kconfig setting the limits for n from 2 to 256 with
default as 2. However, setting the page content in such a way that
kstrtou8() reflects n value as either 0 or 1 bypasses these
restrictions leading to a null pointer dereference if n is 0. Fix
this by adding a check for n < 2 and returning -EINVAL if n is
either 0 or 1 consistent with Kconfig logic.

Reported-by: syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=791be35f1fbcc85d06d7
Fixes: fe5a6c48fd95 ("usb: gadget: storage: get rid of fsg_num_buffers_validate()")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changes in v2:
 - Change check from n = 0 to n < 2 consistent with Kconfig logic
---
 drivers/usb/gadget/function/f_mass_storage.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index a50743caf083..4e743be220cc 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2747,6 +2747,9 @@ int fsg_common_set_num_buffers(struct fsg_common *common, unsigned int n)
 	struct fsg_buffhd *bh, *buffhds;
 	int i;
 
+	if (n < 2)
+		return -EINVAL;
+
 	buffhds = kzalloc_objs(*buffhds, n);
 	if (!buffhds)
 		return -ENOMEM;
-- 
2.55.0

