Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52365218845
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780861091; cv=none; b=XNOHLjLnfl5c1Yg6IqAMxbbJ3y5STfn603Tdf1Gs5Z+oRa52z6lKdSpgfPQJ10epWcGgTQM0YqcNlpVw6f/1OpFnlwVRVnm3Gs8c2S80cGqLFFBhn8FLY5W6grKoTVkEbEvb/PpNmwB6g63VZRgsLvS3dAbkn7nf9dpfi2I5ZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780861091; c=relaxed/simple;
	bh=e49s5ZMygjJkhqkslb7Q+PN9IBI062nSm7lCNZ65+Ws=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=spXk9Fnxoo29wnfvO94jJp2hz9nOdl4NsYGsdFOU/DV7cnddhO5OJhgoKdRKUaiaxoWMJRart7mVwq3giQOET8EQnXZ6BMS7IUmqZt+STfrizy68ptSm2BekCORTO+fR+lQaXiu45GQB8WKN+LmUDgeDFQI9+xClq+JhqDfdnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fujXnUcL; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fujXnUcL"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5175b6c4e19so41480291cf.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 12:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780861089; x=1781465889; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM9MQJQ9ai9IZOwEAek2Fv0YrNG4OoVA13Fihg9Q4rA=;
        b=fujXnUcLTakJ9SzAkA2Jvuns8Fv6rNKRCC0vrQso5gabNRpt8t+0mC1IGncOtM0Yfq
         Y6EnMnwtMKkq9T0WHlyVRBPM5sxNCCs1s2IoydWNMPFPLxPOZ899NHY1k8Tltup2PYdi
         KBNdKSaYTg/iJ/1SaapX6xcKhi74HqqVb7uKDbTyK8UvJ6O5dYkuImOY5l6lCajHNRnI
         rabhraeORTbSoXdfm/uNZoL9X1PPIWynTxbExSzUWoznNTixt1hfhlxztFsTIp0nV+pK
         rcB3bgJfGZ16kHMefoICK4BmOZ4rH+Yp2nViATJE4pNq40egvkqp65jzL1ktZbsujvDu
         gLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780861089; x=1781465889;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aM9MQJQ9ai9IZOwEAek2Fv0YrNG4OoVA13Fihg9Q4rA=;
        b=hrCJWwb0XI2O/c61ntX5CaNsFZmbrZgOtMmGxH/1o2s06SitBEr/wuJ2ubQHrdDmWL
         ASeprbo36fUEuQ2Qth4u4sn0X/YRoDobVWi2VcTlaLKMXXtn48dL2/4qJM6XOIpU+Pn7
         OoEokwB6gr4U3OT+l+n6xZxbp6fiJkaHXz4YkxED23uQnDyABjJr12YpBVHuVKYgA8Vf
         AXaefBky8NP8c9m7Mvc0YiiFc4Z0j5vd/0RdGsFi3FypO4uYwz6XS++P7ZcFsdAMU97U
         MAFAZVC/27sbps/virr1caIWz15rXUgzdB3X9KaqdAGPusXo0w6ThIgrNiMSbuZspTvc
         w+Sg==
X-Forwarded-Encrypted: i=1; AFNElJ+1jEuJwn95X1SXV4kymHFd+WleseEzQjxcrYx56fa+pLDc5DdLU9C38lSz9p/U8FmayBCSbJ9cso8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1EHzYj0Th+/nNsIl3kvrn9I5msq69GONLu9lzMVVEvc5H5z2
	mWZShci8DNu66Z5QJ9Bu9DxBi5aA72qndb0tTwzma+Nwkz7u0tMRQb6q
X-Gm-Gg: Acq92OHlfvuMBep+4RIJH10S7Vu0+WoC/1vlnaIOP+J4X2QriylaXdRczlXVRzABdi1
	6mWYmbQbMYXUngXQF9viFirG5eF0Y8I/nJJ2v2y35DNzNwMRmz6kXVxlCk9oMYy8I2xvrg0E66g
	rz0Bnd2HKqwCZh8xVP8MLeJPQ/OGmCyjd3j91+ptf7Tg4mpsX/3N6jXDST9NrllREkezN78Wn9H
	yS1q2jHO22NsVYsuzVaSnN9JcmR/E1x2OQ9mY32LU6LDbD5kPwzGL3I+9pZm/S50m002wcaFFKw
	89AoffdVSGUNsWxg1CA1v8irDz3sKAGrze3Uyd22WQwVbmKpHVg3mhnajL+BcY7jN2HPBhGRsny
	MSEIPqRLiShqSzln1fI/0O2WocZgr5RHpk5jFHWwXvk4LrD5pIV+C75giw4BQrTbkoAYgNNI+v8
	BYGrSsxAlCFRL03biQ7WeqcCwFJBYNgFcJj0p2NiQTilElO6WKROe0LcMZUItT/72XXE6PM2Sxa
	ko=
X-Received: by 2002:ac8:594e:0:b0:517:8d24:64d8 with SMTP id d75a77b69052e-517a12d2d76mr136169521cf.13.1780861089320;
        Sun, 07 Jun 2026 12:38:09 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:5506:f6a8:9fb3:53d7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775d9efa1sm129725711cf.20.2026.06.07.12.38.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jun 2026 12:38:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
Date: Sun, 7 Jun 2026 15:37:37 -0400
Cc: keithp@keithp.com,
 gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8C929A9-1022-42B3-B1CF-A3B0B07EC52F@gmail.com>
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
 <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Jun 6, 2026, at 22:29, Alan Stern <stern@rowland.harvard.edu> =
wrote:
>=20
> On Sat, Jun 06, 2026 at 09:31:30PM -0400, Shuangpeng wrote:
>> Hi Kernel Maintainers,
>>=20
>> I hit the following KASAN report while testing current upstream =
kernel:
>>=20
>> KASAN: slab-use-after-free in dev_driver_string from chaoskey_release
>>=20
>> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>>=20
>> The reproducer and .config files are here.
>> =
https://gist.github.com/shuangpengbai/167620d391d9634107bfe4d784fcf52b
>>=20
>> I=E2=80=99m happy to test debug patches or provide additional =
information.
>>=20
>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>>=20
>>=20
>> [ 2019.816807][T10106] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [ 2019.819081][T10106] BUG: KASAN: slab-use-after-free in =
dev_driver_string (drivers/base/core.c:2406)
>> [ 2019.820996][T10106] Read of size 8 at addr ffff888168e8a0b8 by =
task chaoskey_raw_re/10106
>> [ 2019.822432][T10106]
>> [ 2019.822899][T10106] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX =
+ PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>> [ 2019.822904][T10106] Call Trace:
>> [ 2019.822910][T10106]  <TASK>
>> [ 2019.822915][T10106]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
>> [ 2019.822932][T10106]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
>> [ 2019.822984][T10106]  kasan_report (mm/kasan/report.c:595)
>> [ 2019.823015][T10106]  dev_driver_string (drivers/base/core.c:2406)
>> [ 2019.823021][T10106]  __dynamic_dev_dbg (lib/dynamic_debug.c:906)
>> [ 2019.823282][T10106]  chaoskey_release =
(drivers/usb/misc/chaoskey.c:323)
>=20
> The simple explanation is that the chaoskey_release() routine contains=20=

> debugging statements that reference an interface for the USB device =
even=20
> after that data structure may have been deallocated.  Since they are=20=

> merely debugging statements, the simplest solution to the problem is =
to=20
> get rid of them.
>=20
> That's what the patch below does.  You can try it out and see if it=20
> works.

I tried this patch and the bug is no longer triggered on my side.

Thanks for your fix!

>=20
> Alan Stern
>=20
>=20
>=20
> Index: usb-devel/drivers/usb/misc/chaoskey.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/misc/chaoskey.c
> +++ usb-devel/drivers/usb/misc/chaoskey.c
> @@ -294,15 +294,10 @@ static int chaoskey_release(struct inode
>=20
> interface =3D dev->interface;
>=20
> - usb_dbg(interface, "release");
> -
> mutex_lock(&chaoskey_list_lock);
> mutex_lock(&dev->lock);
>=20
> - usb_dbg(interface, "open count at release is %d", dev->open);
> -
> if (dev->open <=3D 0) {
> - usb_dbg(interface, "invalid open count (%d)", dev->open);
> rv =3D -ENODEV;
> goto bail;
> }
> @@ -320,7 +315,6 @@ bail:
> mutex_unlock(&dev->lock);
> destruction:
> mutex_unlock(&chaoskey_list_lock);
> - usb_dbg(interface, "release success");
> return rv;
> }


