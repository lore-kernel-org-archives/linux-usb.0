Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634203;
	b=MWN0+A07jMmjrAIzgZpVt1KUVFW65n3TuEIILasI9COfbbvNd6YMNARO0k7/4VwMbkdh
	 pURllkKVCNF+Ufb91JjDy4fMT+QzZcvkfmLHgStUkY60T347Ekl8vGfNrmZFvB5xAch9v
	 RWPjkkS9N7tF/YXMrTJAnOvEvhDmAmHSaVABkto2qv1MMLgMCrjZnlf2N4SJ7QKX0eFfR
	 B7yoJS/OfZIv+xY84aFyN3TOMy9CXdf8EUIiOrwmyJGzMg3Zq8ezETVpgUxlIkc3IRVpF
	 CT0hOdFQJoaqGlc6Gm/ufIl7MF9l9UUGYksTKqWZdFl7/BWvuH6KjEQ/tURArw3ZQdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=feB30mQrQhZDK7EQi84IVLLPpSeQhnjihIk10tU2imU=;
	b=pnKpLPsfNez7vIXVZWJAvTf3qdwWQ03jJwXMfI/A+3IOeiCFgdMWv0wTU5wqzswKjpBP
	 oFvr4h3uffTeAGymppRXnNWf1k2dH25Y8t6EyjKt/fF/tDAFlJXow23BRkgDDCUuunKLE
	 1T8YUl6OczvY4kITcg9+Y//545mVsN2/ln6CI6OwyX28fYv5IVGzoCH46ZOve0mWAvqBD
	 /KqofqKPIPFyIBwBtPLn7Ea8k7TdJM0IyS4s2/C56O8jlZnA+g6ZssYOQsocUIBSpYWW1
	 8IBe8p3aN6PTJ9jAZTM6TYoPx8o06Bjz6sSX2Y3iJp4uOlc+uJNNyJvInp5xwHFcZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKNP8Rq3;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DF606A89F
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427DF606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKNP8Rq3
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed3d8877e6so19126955ad.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794634203; x=1795239003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feB30mQrQhZDK7EQi84IVLLPpSeQhnjihIk10tU2imU=;
        b=xKNP8Rq3c5MhKwI76Wuq+fTw/7dLuwchlW/ggx+qwxVm0T/odp+ptsW4DyOxF13nlt
         +MdQmi7potl4/GHSLHcJdAaVSbdHye+8iG0paTR8VVFnHqTioAEsn+2U+TG3onvubptx
         jEtx9dPm1P+1Ypgvw+NiEaZhif8tAT6Z6+YYngDfmsd4KMrSOmJEta+XYEJOYncJ/3Xi
         zaOhZNPBBoeCWyn7RkFj0Z/k/uotvh3zcMF0PsQm6mH4kMf/Pobw/JY7QMofY09+/psi
         2UGzWPRk6NGGkqdWf3W17uc7p8pHP6hUV4RH8EIZG7kEjyoJu8gZBUg+0zSbPaWyvuTX
         lAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794634203; x=1795239003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feB30mQrQhZDK7EQi84IVLLPpSeQhnjihIk10tU2imU=;
        b=MizuZmNQe2ZjpJaWvzGMYl6zI69z9N0n/TplrQ0yA6oqbXoBEihX7dTqMIXkYrfFbG
         mqwMQ0OAYTf/KS7Boo0rrhJ2ty9V8Q5tJQgx7PUoImEgUkxhAEi2/PI91IKwxQ7gmH9e
         JKScSjHzXdKdi1aM4pCQsGeR7jGPXzNYi8JX+GfBB/1obynRNYFnkazreD2YB+p3eY+d
         6TKP+8lhrr2VGtuyNxi28+GeCJPD2cPpKOEkWdBbjiPaMNMV8BWsuJI9FM0ZH8MoQJF5
         Mcj50/ko++z+hg61YZSHCn9Z4gaoKy31FjXQWJEeyh4JarqTr0og95oSWHls1G7v2ihL
         a5UA==
X-Forwarded-Encrypted: i=1; AL+hErHjQG9xWrslwTmT77JPTm+jzlGIMCfr9PmiryA6GPrGTUwe8ARFEcvLVvnFrRFPacuY9pVf0h0kH7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/FpGuxhBFG5jyR+WigUyDehla9TIFqKcoA5iiTi3Gq1motfyA
	z6ux4Dqt7n5s2pksZ6zJuKif33YYrnP0SnEEDp2Z55BHGIVIcJsBRAlX
X-Gm-Gg: AYBFou2mZTY8jamtYdBd3w3ouMd3BZE+5e9YzCBB/6xXBskIBQwa9u/iZAZ7coqXBIX
	wiCyBIlEilFYP8NsDpeWPo5ojAAZq9mXtN03sQUYT0ILBrIMLaJZ5jaoncbBy259Ybj/+nvpAVt
	x4ig1Lv6220IXcoP1McfSviy4Vzfcr6hy9QgyNnfV3V6vsxwwu+/eSUmr1+BmMo4B7avM13640o
	4PKcWFUM/d5/lZ0fLCRz5N8f+DzTlfdqo6qtCSbD5SWz5l8hEiA+uDhBcRI3dfUkC3cKy4khxEj
	sHToxf/tQH/A5CtNZuEMynJ9LrhPDC1/pEkIgxmf91oThrd3zannIGvZp2+C+j+/fxi6A9RSYB6
	9sfovcUIWiDIvM2MGwSw6lbqGc7nIFFrmOw01i+FYnPBcYnFFqvdcrP1QPG5XHU4Y1jQ6s1XSJ7
	XYx5Z6CjkFMR6k63Uwrd1H+tUu9tKPZiF/nlt/8QDuaqwoU3SQn7nlD7bl60xVE4UGzz0/yyC7Z
	Hm/teG5OSfQNIekk5sbN4Hr7ZFi+xc3JrGHwJ9u3s2nB0aHTy32uP6vu9MTTEX3KMxPW77u0SqQ
	EC3E/k5OEXUA1PfMnbyi6Q9HIkOFjzOJC9fmm4W+OOQ1mUpKG3gH/t3NdkxB4wO59nDrDIIY+h8
	dzFkbNzbtXfjaK+eF0Tg3JC9a1xevpSwELP7I29+Jl1FbhrWaiAulOHA=
X-Received: by 2002:a17:902:d2c5:b0:2e3:1d30:8654 with SMTP id d9443c01a7336-2ee0dd2f0c1mr50807015ad.10.1794634202540;
        Fri, 13 Nov 2026 21:30:02 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2001:f40:90e:5ed4:d53:b5f5:a144:fe4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm17760225ad.54.2026.11.13.21.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:30:01 -0800 (PST)
From: Izaac Chong <izaacchong934@gmail.com>
Date: Sat, 14 Nov 2026 13:29:47 +0800
Subject: [PATCH v2 2/2] configfs: pin symlink target against rmdir before
 ->allow_link()
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-configfs-symlink-uaf-v2-2-48c9cf068a91@gmail.com>
References: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
In-Reply-To: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Izaac Chong <izaacchong934@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794634192; l=4170;
 i=izaacchong934@gmail.com; s=20261114; h=from:subject:message-id;
 bh=UIE5mUHlEZhN2q27XJYyysbnwCRZpYvfHe5txtUgaYY=;
 b=nKNzeaQuUVFb4bZ02va2E/wyA2bAbqTpbF218DU8yauUBpyJp/ViJGGH/6nQdW0uvi1/DkasR
 NsB5smgDYncDTvXZvgHXEKJIrO5MErQ+CRPo5tRPxJGu/Yc0dRroXGF
X-Developer-Key: i=izaacchong934@gmail.com; a=ed25519;
 pk=IFfOWcK2ZRkDtCqaNggolAwpvIidYMt3Oar3NEnvqzY=

configfs_symlink() looks up the link target with get_target(), which
takes references on the target item and dirent but does not stop the
target from being removed. The target is only pinned (target_sd->s_links
incremented, refusing CONFIGFS_USET_DROPPING) later, in create_link(),
after ->allow_link() has run.

A concurrent rmdir of the target can therefore complete in between.
unlink_obj() then clears target->ci_parent and ->ci_group, and
->allow_link() implementations that walk the target's parents
dereference NULL. With the USB gadget UVC function:

  BUG: KASAN: null-ptr-deref in uvcg_streaming_header_allow_link+0xc3/0x270
  Read of size 8 at addr 0000000000000030
  Call Trace:
   uvcg_streaming_header_allow_link
   configfs_symlink
   vfs_symlink
   filename_symlinkat
   __x64_sys_symlink

target_fabric_mappedlun_link() also walks the target's ->ci_parent.

Take the s_links pin before calling ->allow_link() instead, under
configfs_dirent_lock and only if the target is not being dropped, as
create_link() did. configfs_detach_prep() sets CONFIGFS_USET_DROPPING
before checking s_links under the same lock, so the target either fails
to pin (-ENOENT) or rmdir sees the pin and returns -EBUSY. On success the
link keeps the count and configfs_unlink() drops it as before; on failure
it is dropped again.

Fixes: 4768e9b18dc6 ("[PATCH] configfs: Fix symlink() to a removing item")
Link: https://sashiko.dev/#/bug/linux-df6ae898-b1a6-4091-be3b-fbe4c177763f
Signed-off-by: Izaac Chong <izaacchong934@gmail.com>
---
 fs/configfs/symlink.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 1b2c9048a920..52f0f3a6cd7e 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -90,23 +90,11 @@ static int create_link(struct config_item *parent_item,
 		return -ENOMEM;
 
 	configfs_get(target_sd);
-	spin_lock(&configfs_dirent_lock);
-	if (target_sd->s_type & CONFIGFS_USET_DROPPING) {
-		spin_unlock(&configfs_dirent_lock);
-		configfs_put(target_sd);
-		kfree(body);
-		return -ENOENT;
-	}
-	target_sd->s_links++;
-	spin_unlock(&configfs_dirent_lock);
 	ret = configfs_get_target_path(parent_item, item, body);
 	if (!ret)
 		ret = configfs_create_link(target_sd, parent_item->ci_dentry,
 					   dentry, body);
 	if (ret) {
-		spin_lock(&configfs_dirent_lock);
-		target_sd->s_links--;
-		spin_unlock(&configfs_dirent_lock);
 		configfs_put(target_sd);
 		kfree(body);
 	}
@@ -220,8 +208,28 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	else
 		ret = inode_permission(&nop_mnt_idmap, dir,
 				       MAY_WRITE | MAY_EXEC);
-	if (!ret)
-		ret = type->ct_item_ops->allow_link(parent_item, target_item);
+	if (ret)
+		goto out_put_parent;
+
+	/*
+	 * Pin the target against rmdir before calling ->allow_link().
+	 * configfs_detach_prep() refuses to remove a dirent with s_links
+	 * set, and sets CONFIGFS_USET_DROPPING (under configfs_dirent_lock)
+	 * before it checks s_links.  Without the pin, a concurrent rmdir can
+	 * unlink the target (clearing ->ci_parent and ->ci_group) while
+	 * ->allow_link() looks at it.  On success the link owns the count,
+	 * which configfs_unlink() drops.
+	 */
+	spin_lock(&configfs_dirent_lock);
+	if (target_sd->s_type & CONFIGFS_USET_DROPPING)
+		ret = -ENOENT;
+	else
+		target_sd->s_links++;
+	spin_unlock(&configfs_dirent_lock);
+	if (ret)
+		goto out_put_parent;
+
+	ret = type->ct_item_ops->allow_link(parent_item, target_item);
 	if (!ret) {
 		mutex_lock(&configfs_symlink_mutex);
 		ret = create_link(parent_item, target_item, target_sd, dentry);
@@ -230,7 +238,13 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 			type->ct_item_ops->drop_link(parent_item,
 						     target_item);
 	}
+	if (ret) {
+		spin_lock(&configfs_dirent_lock);
+		target_sd->s_links--;
+		spin_unlock(&configfs_dirent_lock);
+	}
 
+out_put_parent:
 	config_item_put(parent_item);
 out_put_target:
 	configfs_put(target_sd);

-- 
Git-143)

