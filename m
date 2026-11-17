Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904349;
	b=vHeUZ3K8wp5gtVHfJ4uaoNT2MP3GcIVmnML8BPA+GKGiLrdCCllpaXTumKyeY4y/ffmh
	 F6RI4ka6zjABUGaPJrYumY8XcUaZE6d9aqNhY2/VA3e4YX0oDa9t8DGNuyJuCAZB7m5B/
	 ieVwMwQkMVhZVMAWarNAOZOo7zTnr2LVxjAJh0iR394SXGgIjtjEH8wJml0LNNlv/5J7E
	 PZNoHS+HESnJBSmahFnkncBkKsJ6rD7fZZfHV9Hrxwj2zDSUczrxjsFv/maiQ5gcgEpVj
	 1Rn5FLjRu+xbLIznLpeuSeche9SSuIKhU8aBNEzE0ZCkgVXmEl3uJ1pDaujuoy6jKeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
	b=jTkSjkwTqT0Co/Puh/OHGi41bNcQChG+I9X/3R0HHdJ3AWttG75+LhuaOiHoivFHMtkm
	 I7ihp+c5xJ7c6RdKWuuWW1/cATTaf3FInzwRuJSU/b5LXURlYzlZJtbsItfV8Q6U8/Pm/
	 zIqGWkmmAmomUQ1wmVbOf32mo1ObzCiG+P2uaL2LNxrx7NpvnyiJUCAydbo0G2A1xFXov
	 vVHVhdyGONBAGLJVppG6Vrd8DvmDWV3eACJmICDGe4j4tRVmGUSX1GL5X3Z3V8vN47kpf
	 eWQXh+iKFP3BnYpNtftF+30jFR3/eFFJOsOW05eotFd/tZKwin3Zq2uon/H9fAxm7IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3B8606A8A9
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF3B8606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EFPX8Vuf
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49412eb1474so2235574f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904343; x=1795509143; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=EFPX8Vuf7iz+NzEUQG+pPgjK/MbrESqv3n9ATmra3Zopp4tpstszPHFfE2sR6EI1XH
         /MuIqTxoWkMXSLrvcYnqUGQvNVGY6YndEf7Smwels/t/G0PiJAqa5YTB3/XSR2c5vF/4
         5S685rADCuM7kD+KTHsn5xD0Bbvj+kfNJN7h3Eeu6Tgpz77cxc6E5ixV5T0A3r/KAOuP
         +pclbSVYUTOzYQ2RRiRVVs4C5Z7y/NhXCRc6Of4Q0fL8jD/Em4FfidsaQN0h6TdkChBo
         DufH5bn8tmF4fp27j4WWCE7M7sjar8yCORXmuz1wFPQxfWworU2xHCWyEC/YN83R4E+t
         3i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904343; x=1795509143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=m8eSQlA9fa6nKhiQEsTUs1aSJQZI6421oHf/uyzQnXMM/CMYe/doFHWaEh4XFKgac4
         yJ0QplBH1u3S02g2qZzztDry8/4787aNTzjcorHC9KV9MWmAZLijvcWARNyzECgDISmC
         2gpQjCyXPtNmzQ66oat2QUTj3cWsvjgmlUuL4FjbhgnBAe/GgSsjXBpC7nNzPlgWWhq1
         4l8oCRCP6zjZ3CJxAPNhy7zG414aZ8e3Sf/bgujVOnGZuhX62mTcYRmoIaucgiC0IN6e
         J6QJslL2qE0DQR0E00GiAKxB+GzuR5GGd0ryXoFxO7nSByBtiUmH/QuW6DZMLrPVnmHS
         TBbg==
X-Forwarded-Encrypted: i=1; AL+hErH+JSuMwGYH2gimew4kiaKn/7bPrSKS/AP8tmbAzbQzKhFPJfFbmw0VpUbEHzkfyox4sUOI0XYP6l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XrikdkgJzOHc7rcJmUnGEC+H2O3e/or0ZadkRQdNjogun43+S
	EWCaXq5U9rhyIskZFQrI40g2v8hP+H5nqZ7JNqwTwgSxXrIZju8o+Q4Q6lJz+poxA7dk
X-Gm-Gg: AZFdTZfBHBNEoSbovKuHJWXxP8BOBCMo4UJT5zbKjfebQjmFt/qBEMFF+GCkJi5tijG
	5cvwyy6a5+4+dYndCAyEvCYzMz3GDD2B/tZQ2hh3UseGym7U34852XMhiBID+IQG2Km0azkGp23
	+XDtrrFwwW2PrWLw0beBPrP7YSs7tB4jNoKqZE/sLRBu60OeJH+DAI9+Zr8nDgxoEdDC+LGCSsK
	wwff02lIrbCEY3/RmR8MdPkAqdYuFae7Du0Mwzjh1hMgOOboUbPZf9SyhIUZcqaUSVBVGHPZGzO
	0JaL8sMYjyQMns9RwAmDDP83X0RaESYkfQaDukstaHYMUPEwkAjofLnCasucIdreYVOAFCsa4hB
	7Qm3pFgdk7iX+c1gaawJG1V6QF20akAnVLGYVKSsVpCWfmE1zVMOKXg0r9JJi2TwIAp60uji4T6
	K3YzMEeX5f3uSw+Du36vgnFSTbRiT8fCQLZ7l5LOp4Dvnel/EI66/E9ftV6tlIUxmyRvRzXX4QU
	UcSruvDXGzo+W8yPPOijq/RbnS4Ek/ePJuVDGFpB9SD/gQnj0XjucU4YQeXzrK8mVS7uevl/noK
	RnhYbPjUnYPOoWvnDk5+cQQwu82Cs8oWZ6/JKzW82K2Zaiz8GWB5m45xPRIEmKDB1AXwylM8ku2
	c+f0xDA6FGDhsFc0gICfDbFqBhLE2ymwH3IFa8xu1TNdplcHK6FE79oCI
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr27089117f8f.45.1794904343236;
        Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm43646659f8f.44.2026.11.17.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:32:22 -0800 (PST)
Message-ID: <fd39200976086130cc82d59699a988fc3e0689cf.camel@amutable.com>
Subject: Re: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 09:32:20 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/openpromfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
> index fb8d84bdedfb2..6cd02d456bac9 100644
> --- a/fs/openpromfs/inode.c
> +++ b/fs/openpromfs/inode.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/string.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> @@ -419,6 +420,7 @@ static const struct fs_context_operations
> openpromfs_context_ops =3D {
> =C2=A0
> =C2=A0static int openpromfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &openpromfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
