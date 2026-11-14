Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634200;
	b=J2ccrLvt00CwlR6PGiWcIFq4wZY8FhuFrb+BrYnVL1cgnfCFP2+3PyFdOlrdbn7z0GYJ
	 r51pUjlsU2BGUXauZY/5UFuLMTfQwcEvc/ugPNzmyicgvqhaFfu3nANCTM1eOEVWRNN01
	 lm03d1jzrisE9iRBBJ6/Coobe/2zFxafkBC8qNYJDLIn/eNEBFmxc3IMs7KRDVulR1q90
	 BGuWELmRw1xqtZd4jZCaIoBU9R+rfROvLr3VkH9ouHMMNpjOBLpGi3VxyiKv39UR6wZsk
	 wGhZkHkmadUfiF/nSLtXe59WbeMuS2LKK+7MfHFqjXVQCTyTGEnl9o2xM3DemC7podQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v7tiXwNesGNvlwhrKa30W0lwvT4MH6zCN7lk+DjVWfM=;
	b=EpkafRSE5wJz8by/fA4xdL3dLxhBRDAPe4531yCQQNmLLQjbtPBWAYo25FBby+QDDCG1
	 Uh2NZ5YE0+PweMrMcnHdXZoMBagsSzxuga67vOdQ5O7jRHbow0ctHwDT1s+cIqy9iu2ZZ
	 EeoNV1dKmyIUN1ke5dvkOvsea9DOQjvjg4xiC0xY3rCU1MaqGQVi2OWBM7+VWFmLSetV5
	 gFq3Z4LwOErbpyIlVrnFlmYiq6eE5ngUU+3qGtEVqxdQXHGWVGGT0+xk7y/mtdEAVsA26
	 NkYB2yevVKJUrKMBie8kdW3YqbpnRtLAgf6BYtOqsohXfo7SCvpKmZh/rfEvfpLH+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aff7W8dw;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF3606A885
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DF3606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aff7W8dw
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ede7cb02daso19700835ad.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794634199; x=1795238999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7tiXwNesGNvlwhrKa30W0lwvT4MH6zCN7lk+DjVWfM=;
        b=Aff7W8dwRWUmPT5Z/fScXq1J+ef9a/+thKodDB2J31gBDrFhworS6ljAZGwSuP1JTE
         hHfBLHULz1oGj4MTOZs5BKkm6kx3vevdKWOh40j1rKyC0sU3T7liiqThcTBz9dfo0OV8
         4bkcT07UkQ2AZUHh9CiV02uEgV0RofPSr8EEg3aF8l29fhemK4zNPaU+tj1+ksdoXxfF
         UrI/Yl/fumBgqb/mUu0SzCa0QBsXB+3Dcct2+Ar2XfIV2y9JbTNuW96X5UfMhRLDUzVB
         F1hZ4855oCbECyOzbWgtUZE2F52ykmG2e4TU01lWjFwYcW2B0V8tcSIrpErA1+m1pM3K
         zE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794634199; x=1795238999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7tiXwNesGNvlwhrKa30W0lwvT4MH6zCN7lk+DjVWfM=;
        b=D6M6thEpeoDD/VDQO7JD3nCfnDZzRBczpLruUHr2OW8RsBsueHrRxmVOt+JGz5pSZm
         cTcpGSPf+UqqvhIwhM0cI7xVYv7hEfWApk0qYUsahfngdR0yjSIB7B7eUKWfYiGCZnNx
         3kaeTJi6gO+6/Ao2J+1E797/+Sxvi2qPXUyR0V8zpyBXOT1BBTvQbhu6T0vGF8xWkOrY
         zpT7mbKyvtAwcuAoW4VTiJhvjDUw6wUU+IpdH0xmBLgORDrn1pIfd43eg/xF4GnJDU4K
         zQBqgq9yfKnCjUO7JQL+8uoCoxsSKJHkR183PhELMbO+0aYe5jEvmBeCk1w27JrXne0b
         DFNA==
X-Forwarded-Encrypted: i=1; AL+hErHhfq1imEaCwy1Ls1mP7EpXhD0dcsOlHON5XAGZDZCpGgcq6P9OgYDYJJdpg+NwGlpT2IIjeyA06SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z80+loioazWAER5Zrpny8JDZihnQO1vEi7+LjuDZH3SEK7/rKUe
	f8XsXPfXrb8+iTQ2jeAwaMjw7fKe02izE1WTEqrNP85Gal3wxljUbl2r
X-Gm-Gg: AYBFou2f4+FROesPnEvThRQB8TguP9S71LXlgw99UCnQHCEx44dsdoRAFvy6uQRG1FF
	v+tgR525j8r/geVs/wkQ0z36SPcYBzPhbnpwdLANH0AvFac85nLA5k/diF1HA5MCJhl/ZJQx7ER
	O7ej5WAq+40cb9Bz+Ef4xXaxLgm08jMEhdvva36a6pKr+VOlu71l9JGjVIlEp962qvc46r7BHMw
	YGVaczu3M5iWDk2n9KXyIf+IcfiV+1gGFKWpkJoNiI7KwLTtUSkZpEWok6jUlrjXWIzr8uA7n3g
	w3+3zRaebfYQYrCaJJjvEteRZNnDSg+3A/PR0WRNcFz1aM4aXND+AK7ZFNsy27hng01rET3V9Me
	mqCDuaxTwbloKMuBmviNv9Xl/w236DndPEs4/kodbV3KFrgZdFgqribV/RNPzUWLTn5UIw9qDzd
	gH6AOPKBdeft0aBLCO7UEa9mIPoRF3tadX0DExHGY532fJ1xDH4nYBZRxRPrpPEYOS7ICOROCrM
	Ky/58OX+RbCBGv43pH0xkegOmKN5X6qOR3rKapLDeH2QDrYfF91pxAi1FwPSrI+tDliybcOQ84H
	u7u08dYgVgxUbLwJXtBpnoTr4plyBTyjJWL7RvdICOephDQhXFIuyardkKqIpuHdQIBankHGsuh
	1vh+KWSb55Jqg6XRFwD5U32bKOTDHB40rlSgkW2YqLshwVHdskqln53U=
X-Received: by 2002:a17:902:c411:b0:2e5:debe:cb4b with SMTP id d9443c01a7336-2edf1e7b0a5mr61346585ad.10.1794634199067;
        Fri, 13 Nov 2026 21:29:59 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2001:f40:90e:5ed4:d53:b5f5:a144:fe4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm17760225ad.54.2026.11.13.21.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:29:58 -0800 (PST)
From: Izaac Chong <izaacchong934@gmail.com>
Date: Sat, 14 Nov 2026 13:29:46 +0800
Subject: [PATCH v2 1/2] configfs: fix use-after-free of default group in
 configfs_symlink()
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
Message-Id: <20261114-configfs-symlink-uaf-v2-1-48c9cf068a91@gmail.com>
References: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
In-Reply-To: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com, 
 linux-nvme@lists.infradead.org, Izaac Chong <izaacchong934@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794634191; l=3255;
 i=izaacchong934@gmail.com; s=20261114; h=from:subject:message-id;
 bh=BLAVQgSrEVNkosJ1RawvnEwRkMMxTH81O2DKWV4iSkg=;
 b=xwJeQRV6EtAOLyaWisKx2TbtvO1K9D6hg9FkRjY8VTX+fnyRwQVeAN35/0byNBdaNsvX7iYMl
 1rIG8bSOcNnCMtfjXczQrkkQiq5s1v3j5nv2pud5kUaBkDHcaEfyOI+
X-Developer-Key: i=izaacchong934@gmail.com; a=ed25519;
 pk=IFfOWcK2ZRkDtCqaNggolAwpvIidYMt3Oar3NEnvqzY=

configfs_symlink() drops the parent directory's inode lock while it
resolves the link target, and keeps a reference to parent_item across
that window. When the parent is a default group, such as
ports/<n>/subsystems/ in the NVMe target, parent_item is embedded in
the containing object (struct nvmet_port). A reference on the embedded
item does not keep the containing object alive, so a concurrent rmdir of
the port can free it. allow_link() and the final config_item_put() then
touch freed memory:

  BUG: KASAN: slab-use-after-free in nvmet_port_subsys_allow_link+0x41/0x2e0
  Call Trace:
   nvmet_port_subsys_allow_link+0x41/0x2e0 drivers/nvme/target/configfs.c:1059
   configfs_symlink+0x59a/0x1030 fs/configfs/symlink.c:196
   vfs_symlink+0x18b/0x330 fs/namei.c:5794

detach_groups() marks a default group's directory S_DEAD while holding
that directory's inode lock, before the containing object can be freed.
So drop the parent_item reference before unlocking dir, and after
re-taking the lock return -ENOENT if dir is dead. Otherwise look
parent_item up again, which is safe while dir is locked and alive.

Fixes: 351e5d869e5a ("configfs: fix a deadlock in configfs_symlink()")
Reported-by: syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0996ac2197dd7420c3e
Cc: linux-nvme@lists.infradead.org
Signed-off-by: Izaac Chong <izaacchong934@gmail.com>
---
 fs/configfs/symlink.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 89178f5d371a..1b2c9048a920 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -166,11 +166,11 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 
 	parent_item = configfs_get_config_item(dentry->d_parent);
 	type = parent_item->ci_type;
+	config_item_put(parent_item);
 
-	ret = -EPERM;
 	if (!type || !type->ct_item_ops ||
 	    !type->ct_item_ops->allow_link)
-		goto out_put;
+		return -EPERM;
 
 	/*
 	 * This is really sick.  What they wanted was a hybrid of
@@ -200,7 +200,20 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	ret = get_target(symname, &target_item, &target_sd, dentry->d_sb);
 	inode_lock(dir);
 	if (ret)
-		goto out_put;
+		return ret;
+
+	/*
+	 * parent_item may be a default group embedded in an object that a
+	 * concurrent rmdir freed while dir was unlocked, so we dropped our
+	 * reference above.  detach_groups() marks dir S_DEAD under its inode
+	 * lock before the containing object can go away, so it is safe to
+	 * look parent_item up again only if dir is still alive.
+	 */
+	if (IS_DEADDIR(dir)) {
+		ret = -ENOENT;
+		goto out_put_target;
+	}
+	parent_item = configfs_get_config_item(dentry->d_parent);
 
 	if (dentry->d_inode || d_unhashed(dentry))
 		ret = -EEXIST;
@@ -218,11 +231,10 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 						     target_item);
 	}
 
+	config_item_put(parent_item);
+out_put_target:
 	configfs_put(target_sd);
 	config_item_put(target_item);
-
-out_put:
-	config_item_put(parent_item);
 	return ret;
 }
 

-- 
Git-143)

