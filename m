Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899628;
	b=0Net9kKi4Xdq2hMVzlTDKKr+Qsfw5deCmSP9TjYYwQQ5RuWVn1d1PjfqH7bWItK9hF2s
	 WI+j3BJYdk44TM2azA+r0hV3iK/0nxPMrelIAZXRPW3td8VItSlDtEwGbANiXABSr5uFd
	 6jd80x7f+7FRibJ9QGl1U9IFTm1KYEBcG1VKwBjw7Gg7znzbtPDqU4EUNDqTEIJAyAq8p
	 L2Et99ztMRjPQTpOxCcysFk+kVSrj1bfYruLImn/PTYGluW0qOR3MBOrDzEHJOPJi09XJ
	 GkcWo942004c/97yvouHb2NGRG2FNgVpEvTvwTWvWl3UAkxrGIYUs3VapAMjnYEm8xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899628;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=STFPpxvj3CYGugltmWK2wc4rYUcp7Ha/iqyr2/j6Sdc=;
	b=05nZcTnRV0jLlLBxcrY9EWIIMPABZz2yTJBKRQbl4u/VrygHYY1igMiDrbjtcro8QgcI
	 OcDAcP86hsY11t8hlTqft01WzQLOwZq4ylqGtTZ5aAhL6gtcAoTit+IffZd+76XOWXBxh
	 kOALOM4HbW518wfWGczTrnJ/pwN4rGuT9+lkFb/4fBl4pGSr1UReV89nCxMafKc4MYn0v
	 aDSAMYxb2KoXC6VSA2a1wdotWGgiFKp8vff32cIGEqTPCIufJPZ7kQdJ9UDu0Lqw2iHVM
	 Vbjidoe3ubKx3U00oWHeta/zEDKsPhjmGicEa6r5dPl+ixnPtW9PmRMLUzukcjrNGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJpaL7s+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A2606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJpaL7s+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7ED1F000C4;
	Tue, 17 Nov 2026 07:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794899627;
	bh=STFPpxvj3CYGugltmWK2wc4rYUcp7Ha/iqyr2/j6Sdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJpaL7s+eRpYIOck+kaQpYHM6UbD94cy6ZVrpUT1dGOb2wkzQM62YplXp70Od21vY
	 t0L0tUtF/JXj+ye7syfL9jpXFwFivIwbCu0xUCIACbDjwv2v8xo14+0h+d1n3pkr1r
	 LB5WJvBDgOJCMIOBx9h98UDtcXl7j1U8bTiugPfPaPUh6lngxy/2nHx3Fqr2/W47TA
	 0XWT1taMl2c+RffZtHfCDqEKqrBBig38OM0xkVEQDWJdxBfCxCDgQLx7kjj0zNYY7/
	 ZqnudF2a7bMn+fcSap+dOIr9/Xe4YPsx+OW0sV0ZG678hrqvIXzi2hjOs3+pHw3yZz
	 BXqHaST9fwIXw==
Message-ID: <sashiko-outbox-218297@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] configfs: give the root directory inode its own lockdep
 class
Reply-To: sashiko-reviews@lists.linux.dev
To: "William Chuang" <founder@logarcheon.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117065314.4309-1-founder@logarcheon.com>
References: <20261117065314.4309-1-founder@logarcheon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:13:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] configfs: root inode lockdep class masks real rename() vs
  mkdir() deadlock
--

commit 058eebb48180eef94995fcd78f689f610830d617
Author: William Chuang <founder@logarcheon.com>

configfs: give the root directory inode its own lockdep class

This commit assigns a dedicated lockdep class to the configfs root
directory inode's i_rwsem to avoid a lockdep circular dependency report
between USB gadget and target subsystems.

> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index d8cac1cbf3bd5..d20d2fd1e1809 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -58,6 +58,15 @@ static struct configfs_dirent configfs_root =3D {
>  	.s_iattr	=3D NULL,
>  };
> =20
> +/*
> + * configfs_depend_item_unlocked() takes the root inode's lock while a
> + * subsystem's own locks may be held, but nothing takes a subsystem lock
> + * while holding the root inode's lock.  Directories created by mkdir(2)
> + * share the default i_rwsem class and are locked before their subsystem=
's
> + * su_mutex, so give the root inode a class of its own.
> + */
> +static struct lock_class_key configfs_root_inode_class;
> +
>  static int configfs_fill_super(struct super_block *sb, struct fs_context=
 *fc)
>  {
>  	struct inode *inode;
> @@ -74,6 +83,7 @@ static int configfs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>  	if (inode) {
>  		inode->i_op =3D &configfs_root_inode_operations;
>  		inode->i_fop =3D &configfs_dir_operations;
> +		lockdep_set_class(&inode->i_rwsem, &configfs_root_inode_class);

[Severity: High]
Does assigning a separate lockdep class to the configfs root inode's
i_rwsem hide a real ABBA deadlock between renameat2() and mkdir()?

In filename_renameat2(), __start_renaming() -> lock_rename() ->
lock_two_directories() runs before vfs_rename() checks
old_dir->i_op->rename.  When one parent directory is the configfs root
and the other is a descendant directory (such as target/usb_gadget/naa.*),
lock_two_directories() sees that the root is an ancestor and locks
root_inode->i_rwsem before the descendant directory's i_rwsem:

fs/namei.c:lock_two_directories() {
	...
	r =3D d_ancestor(p2, p1);
	if (r) {
		inode_lock_nested(p2->d_inode, I_MUTEX_PARENT);
		inode_lock_nested(p1->d_inode, I_MUTEX_PARENT2);
		return r;
	}
}

Meanwhile, mkdir() on target/usb_gadget/naa.*/tpgt_1 locks those same two
inodes in the opposite order:

CPU0                                  CPU1
----                                  ----
lock(&naa_inode->i_rwsem)
                                      lock(&root_inode->i_rwsem)
                                      lock(&naa_inode->i_rwsem)
lock(&root_inode->i_rwsem)

 *** DEADLOCK ***

CPU0: do_mkdirat() -> configfs_mkdir() -> target_fabric_make_tpg() ->
      usbg_make_tpg() -> configfs_depend_item_unlocked()
CPU1: do_renameat2() -> filename_renameat2() -> __start_renaming() ->
      lock_rename() -> lock_two_directories()

Splitting root_inode->i_rwsem into configfs_root_inode_class prevents
lockdep from detecting this lock ordering inversion until a rename()
actually races with mkdir() or symlink().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117065314.4309=
-1-founder@logarcheon.com?part=3D1
