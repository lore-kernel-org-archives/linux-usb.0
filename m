Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635976;
	b=qAEHkBF1LJmN0thaVq6el+PeKar6XeY5fLdtk7dhVxUOZAAz+peH9GU0DF4Y0QLqSN6x
	 TxawhdOs6UTHlpvXChYPWL0ClvFuRTDN7BajeTd3dA+wTjC5RlmfaOYfgK9ShuvPH/Els
	 XS6WwpTZ41U/0rrYjfTPS+6dpYdMAN8ejh1FTSdT1wPuyiuy+1Q+8c84DKc9Dne1u8kLV
	 +f/zKw2o8UdfSD1UKY6E9IuAagzVcBhlGN9DJtlDECxwqoQYe3I6Cwuljs8g7j94rnZ2Z
	 Cp/HL9//B6KudVUsOspZr0k5wpaxlmN54gEtyPPtCB/aWi2N++jTwOe5LXaYo/PfCZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635976;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E8p1j6btKjJgLsXTXEFi8fIzHNEEGJ3IhlA3c/ECbx8=;
	b=B1ERcPA7oS5C0gdX1W2jAsMKP2DpcG0bBSEOBsaMbX1zTxSxn9NL8Jr3MrvH1XFRteI5
	 K4R6Biqy80whpB4VegY28uYXmb1eb1Dym8BoizvWGnSP8EjVb3X/48Frq1/avuP90qoeC
	 wIeZ5yig5LSLjEy5Up/fRI2C1IUrTaCbff85VaSnInoDKyNu6b5SbQ8c+Y5lBSMpJ/PhL
	 4xPeMrugsyDpabmTW25I9HLQvAtVVFD66Xswx9S1BWRPT9hP9epZGoXZ0WYOsLdA3bgLW
	 OtdNJNg1k7kGf1C6QIJbwydOVxa/qzyQxbgqsBF6s79KMgJ2JlR0NVKAmdOjdg3m2Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FD5lhm/c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB6606A329
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FD5lhm/c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D381F000C4;
	Sat, 14 Nov 2026 05:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794635976;
	bh=E8p1j6btKjJgLsXTXEFi8fIzHNEEGJ3IhlA3c/ECbx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FD5lhm/c/W/IkVupTjCGnZRevnhHt75pUEcLUuswnJBE2/yhAtoAG6v8in86gWh0P
	 yDN37Bg4WKrt4uPW6SI8LQGXMvr2ubQ2w+0EO2X4hlzASGjW5gM+LTgZNHekV2wJ/y
	 TWVp7NblhRgecH+crzCSDPRuV6hZHICWisaqnF49RwrK8v7oCdVI/nsIJ2OKKFOlGI
	 fFTJtivVpNcvehBEz0CAuUoS4Q0sqqV25ru5ny23PsmerEqMGq5D9b384l/gK5k18U
	 LS1W6i40tREpBJDJe80v7MyLaHS15lhlcDCKx2e1+LNtkZFOAM0EqD+VbAHOiAPtnM
	 rbq5RylGnqLFQ==
Message-ID: <sashiko-outbox-214196@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] configfs: pin symlink target against rmdir
 before ->allow_link()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Izaac Chong" <izaacchong934@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-configfs-symlink-uaf-v2-2-48c9cf068a91@gmail.com>
References: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
 <20261114-configfs-symlink-uaf-v2-2-48c9cf068a91@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 05:59:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] configfs: missing CONFIGFS_USET_CREATING check before
  allow_link()
- [Medium] configfs: target_sd->s_links modified outside
  configfs_symlink_mutex in configfs_symlink()
--

commit e7abed27dac194611cbdf483f151d7345ac8c114
Author: Izaac Chong <izaacchong934@gmail.com>

configfs: pin symlink target against rmdir before ->allow_link()

This commit moves the target_sd->s_links increment and the
CONFIGFS_USET_DROPPING check from create_link() to before ->allow_link() in
configfs_symlink() so a concurrent rmdir cannot unlink the target while
->allow_link() runs.

Link: https://sashiko.dev/#/bug/linux-df6ae898-b1a6-4091-be3b-fbe4c177763f

> diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
> index 1b2c9048a920b..52f0f3a6cd7e0 100644
> --- a/fs/configfs/symlink.c
> +++ b/fs/configfs/symlink.c
[ ... ]
> @@ -220,8 +208,28 @@ int configfs_symlink(const struct mnt_idmap *idmap, =
struct inode *dir,
>  	else
>  		ret =3D inode_permission(&nop_mnt_idmap, dir,
>  				       MAY_WRITE | MAY_EXEC);
> -	if (!ret)
> -		ret =3D type->ct_item_ops->allow_link(parent_item, target_item);
> +	if (ret)
> +		goto out_put_parent;
> +
> +	/*
> +	 * Pin the target against rmdir before calling ->allow_link().
> +	 * configfs_detach_prep() refuses to remove a dirent with s_links
> +	 * set, and sets CONFIGFS_USET_DROPPING (under configfs_dirent_lock)
> +	 * before it checks s_links.  Without the pin, a concurrent rmdir can
> +	 * unlink the target (clearing ->ci_parent and ->ci_group) while
> +	 * ->allow_link() looks at it.  On success the link owns the count,
> +	 * which configfs_unlink() drops.
> +	 */
> +	spin_lock(&configfs_dirent_lock);
> +	if (target_sd->s_type & CONFIGFS_USET_DROPPING)
> +		ret =3D -ENOENT;
> +	else
> +		target_sd->s_links++;
> +	spin_unlock(&configfs_dirent_lock);
> +	if (ret)
> +		goto out_put_parent;
> +
> +	ret =3D type->ct_item_ops->allow_link(parent_item, target_item);

[Severity: Medium]
Does checking only CONFIGFS_USET_DROPPING here still allow ->allow_link() to
run against a target that has CONFIGFS_USET_CREATING set?

configfs_create_dir() hashes the target dentry with d_make_persistent()
before populate_attrs() and populate_groups() finish, while
!configfs_dirent_is_ready(target_sd) is only checked later inside
create_link().  If the concurrent configfs_mkdir() fails during attachment,
its out_unlink path tears the target down without calling
configfs_detach_prep(), setting CONFIGFS_USET_DROPPING or checking s_links:

CPU0                              CPU1
configfs_mkdir()
  configfs_attach_group()
    configfs_create_dir()
      d_make_persistent()
                                  configfs_symlink()
                                    get_target()
                                    target_sd->s_links++
    populate_groups() -> fails
  unlink_group(group)
    unlink_obj(item)
      item->ci_parent =3D NULL
                                    ->allow_link(parent_item, target_item)
                                      target_item->ci_parent
                                        <-- NULL pointer dereference

Checking !configfs_dirent_is_ready(target_sd) under configfs_dirent_lock
alongside CONFIGFS_USET_DROPPING before incrementing s_links would prevent
pinning an item before configfs_dir_set_ready() has cleared
CONFIGFS_USET_CREATING.

>  	if (!ret) {
>  		mutex_lock(&configfs_symlink_mutex);
>  		ret =3D create_link(parent_item, target_item, target_sd, dentry);
> @@ -230,7 +238,13 @@ int configfs_symlink(const struct mnt_idmap *idmap, =
struct inode *dir,
>  			type->ct_item_ops->drop_link(parent_item,
>  						     target_item);
>  	}
> +	if (ret) {
> +		spin_lock(&configfs_dirent_lock);
> +		target_sd->s_links--;
> +		spin_unlock(&configfs_dirent_lock);
> +	}

[Severity: Medium]
Can modifying target_sd->s_links outside configfs_symlink_mutex cause a
concurrent configfs_rmdir() on the target to fail spuriously with -EBUSY wh=
en
configfs_symlink() fails?

Commit 9a73d78cda75 ("[PATCH] configfs: Fix failing symlink() making rmdir()
fail") serialized s_links attachment and rollback under
configfs_symlink_mutex so configfs_rmdir() cannot observe a transient
s_links increment from a failing symlink():

CPU0                              CPU1
configfs_symlink()
  target_sd->s_links++
  ->allow_link() -> fails
                                  configfs_rmdir()
                                    mutex_lock(&configfs_symlink_mutex)
                                    configfs_detach_prep()
                                      sees target_sd->s_links > 0
                                      returns -EBUSY
                                    mutex_unlock(&configfs_symlink_mutex)
  target_sd->s_links--

The same race occurs if create_link() fails after releasing
configfs_symlink_mutex and before target_sd->s_links is decremented.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-configfs-s=
ymlink-uaf-v2-0-48c9cf068a91@gmail.com?part=3D2
