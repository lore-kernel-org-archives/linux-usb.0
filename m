Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824998;
	b=VNwLSMSCUvEXZxr+pxSYMgeRh6IBy8MmZaQZbpRtGHf7Ule15miDd/DY+wlCm3cwuT89
	 /cEPKkwi2u1Z1uUU/c1UeA7fRUM94Zk+qFfeWLz28mTVX70wFL0rEBZduNI7+Ij/SrqXq
	 wC5stsfIITmVvxUL8l2sHzXE4VD4N+gRWbYEUUeRfv7RfCst/NgRrcKshu3GL5wPjZiZd
	 O48jxDGtfbcfDUW9di9FCFy0mAF07NYJdOrq+jLePDwWu3B3W1c26xloBwpORoi/5Txsw
	 8QHGKFBJTEdlaZZL46FFM7gm3pD+2+iRwtGx9sZ8LG31ELqjU2Iq7Nn4aSoaDq0edyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824998;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fPNxpn2ne8B9gjdkbZAKbu69OppQftHEsR6h1Ix/+fI=;
	b=HZowMjfXxdA6cBBQaGWREpP4b/OWXqe65s8dExwDgOTlgIiVpS+ACKRdF16ZB40qqlZZ
	 zxoPgdWLtkKIs+/V4Eh0uRNLlGEBXoV98t6SzIlpmIvAccyLSJocTMcgqbcmZhvkHTpoG
	 cLXOSJT4Hgn+JcBHRS32SAY+WknS4/s3996dP5ZH8E7vKTfYuaMSsUmxO8p0OM60BtDr1
	 gstoToZeyWSYgQeVXHrUCY1xvIX+xgwTfgiTg3AMs2a17eeJWB8E7eIO5+Dd8PHoOAO/p
	 6AgJy4oqS7N1FghWLVm2b9OOJt1zVku3bUUgNt7PmZRxie1MBt8jHiUwWllzqYGmlyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YDNppX/e";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD3606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YDNppX/e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8471F000C4;
	Mon, 16 Nov 2026 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824998;
	bh=fPNxpn2ne8B9gjdkbZAKbu69OppQftHEsR6h1Ix/+fI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YDNppX/epaRTwCxnuotCVvWLZigfGK6mzoimpWVvSnFhttv+RqniTgfsBDGDz/J81
	 oLtho2zzADQbeXMeqEkLQwYQOCae8Sq/IdMr1CBCOK0ZTpWhCwIcadwvT3fsRRt/pE
	 UCrDMSQvnPB4ABAmfiQYCvGzoxNSu9A98E95MmmbZh1Lf8Xa8twbLzSo0OY7zvGVc6
	 N8/R+NUR4CqepjnVnk+jLw/+6ba4UT9PGoFKYkca1M4u5VYkRupOZfLYgsWAJqa+WD
	 jnU3tYusG5otGWZx8FnppRkgQCO1MUtjI/+9SjFZkL+JblNLn0nyQt1Zv6pjZgn3rt
	 EvrYyhaXoivQQ==
Message-ID: <sashiko-outbox-216736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb-storage: reject too small values in
 max_sectors_store()
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116101604.42161-1-25031212351@stu.xidian.edu.cn>
References: <20261116101604.42161-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:29:57 +0000
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
- [Medium] usb-storage: missing logical_block_size check in
  max_sectors_store()
--

commit 05440cadc022e6dcf9589e956d95f83a1aa8ca56
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

usb-storage: reject too small values in max_sectors_store()

This commit rejects values below the page sector count in
max_sectors_store() before updating the request queue's max_hw_sectors
limit.

> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglu=
e.c
> index 97de28e855626..94131b726ade3 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -591,6 +591,8 @@ static ssize_t max_sectors_store(struct device *dev, =
struct device_attribute *at
> =20
>  	if (sscanf(buf, "%hu", &ms) <=3D 0)
>  		return -EINVAL;
> +	if (ms < PAGE_SECTORS)
> +		return -EINVAL;
> =20
>  	lim =3D queue_limits_start_update(sdev->request_queue);
>  	lim.max_hw_sectors =3D ms;

[Severity: Medium]
Can max_sectors_store() still trigger a warning in blk_validate_limits()
when the device's logical_block_size is larger than a page?

block/blk-settings.c:blk_validate_limits() {
    ...
	if (WARN_ON_ONCE(lim->max_hw_sectors < PAGE_SECTORS))
		return -EINVAL;
	logical_block_sectors =3D lim->logical_block_size >> SECTOR_SHIFT;
	if (WARN_ON_ONCE(logical_block_sectors > lim->max_hw_sectors))
		return -EINVAL;
    ...
}

When transparent hugepages are enabled, sd_read_capacity() accepts
sector_size values up to 64 KiB via blk_validate_block_size().  On a 4 KiB
page system with a device reporting an 8 KiB to 64 KiB logical block size,
writing 8 to max_sectors passes the check added here and hits the second
warning in blk_validate_limits().

Checking that ms is at least lim.logical_block_size >> 9 after
queue_limits_start_update() (and calling queue_limits_cancel_update() on
failure) would avoid this warning as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116101604.4216=
1-1-25031212351@stu.xidian.edu.cn?part=3D1
