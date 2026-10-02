Received: from mail-lr2-f42.google.com (mail-lr2-f42.google.com [74.125.230.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3449C4CC
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946608; cv=pass; b=Jag/9ij+051hp7OX1Dcns5i5IkycWkDqxU6TYf+yArYoh9PYuybHm7XP5/szl6e98fHUD9QYK1RrKHoMIgEcE/NIp3eopVV3Pw5p0zmJqxYpEuGRr6QnPgS3Dz4MPLTxpoHk7BxNfVbSEuh0fcfmU7JqF6LiLq4cOQPFSwhixn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946608; c=relaxed/simple;
	bh=7msk0L4j7bvJi4BhAr+ay58woIkBEKAfwP5pfb80aSA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GnNzL3X9skjPTMysmo8p9fgpYxJ4o2JW0j+XceT25VKzy+JEmRnGrGW/6B5o/f024hgNinfBd4mjLf/ByAE/VgzlKejsxUiafeL5kI5dB8VxCSP8UEvXpR/n9GyEC/AEvM3GMTJk1Ggz+YZhqEa7bEuRuxm0Yb80ZtKhNej8ORU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+YgjlUd; arc=pass smtp.client-ip=74.125.230.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+YgjlUd"
Received: by mail-lr2-f42.google.com with SMTP id 38308e7fff4ca-3a87e1f5c81so114141fa.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 06:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790946603; cv=none;
        d=google.com; s=arc-20260327;
        b=NZE69C+3d45IDqVPTKtNyPaoWt5mBVWEQAZPRjtsMOiO663qVNUxlZt3cOH9ck+8X+
         i9xjhayS7eTjQKEbUd+3o99fNqc/P+4AyJ8CzqIjqFAq0J2H99i+mJb0EsM/31QChv2f
         isA0nMzVgs+0k4xCPp8SUL82FuwHDYMmE06jDwkxmxQvMzJ7ldW+DtRI/C3Gxz3IPapd
         uzN/zpK1c1ytUtFJz4HviVOjQIiDGWl8KsdoEeU2uxujkccQ7UIB4pspJx7dC/oZvPGh
         3/Nm2S0uh7PHvCHRYX0E7gAhVgsWzL0I137HUiwwGW8ZqvGXUt8qDXo1DuqDUcYzlfYm
         bZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7msk0L4j7bvJi4BhAr+ay58woIkBEKAfwP5pfb80aSA=;
        fh=nB0RiY2+ajBHgUhRhCXJkF8zS0/tbcRovOO9UHQeZ7A=;
        b=D8ZWgVZvJD7kNw/Ni120ozlhAP1CYxKRDDtm2EHEjkzXAz4wNV3FaAnPitfZPN2Syl
         a+PBO0A0kKM1Vk5oGQJBbomKE+EO/pRrSYzGOyqj+O7m9xkFNiEMAN5MiNf2qKmVzcCE
         SKc1WPTxy2JMKHdI7om9kVkp1p4WwzYSkBfmopV3graZrlLloy9B+XN3FirkxN0TjiOI
         P7dYZAyX7+1TEkEloVpnAO+54ah4XGppzZc7JQUluf80sISAzvQIMbQqWOZ+ZhiUYbDj
         qw75ItzvZp8GcSQdJed2MXefxyl6ccgozM14dr60D3yFQ4zRyc9uYMFcWzpD2hOcSpSi
         5P9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946603; x=1791551403; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7msk0L4j7bvJi4BhAr+ay58woIkBEKAfwP5pfb80aSA=;
        b=A+YgjlUdIJ+6AI8Ri1ndH++zubZnP3znuNBrpkX7jKUefesv5NnLFIrt07+2EqhfvJ
         /E8Rd2Y3/CYKipOFdWzoGM/0MHY6SRYern+0OxQqZj0zaMpeNqbzysjCefHpOty41qXg
         x2Ky2m8TCXZk4L0sIFsMprw/F7JEs4bbqtaDD4RB5pNLLM1jwXLyQ1UVv3lKZamwZLEo
         Edwhue4r/9qiuAJBK/XiGruKTSsvbo2ffMBh55iwBfqB34M6rifq4ozNl6uttz0RvW9g
         cDnWbAKzV52JHd77PeMXfiKH9997PODAD45Hmk6WCpv5jConMLngKtmk7R4aAN8V4K3c
         0UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946603; x=1791551403;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7msk0L4j7bvJi4BhAr+ay58woIkBEKAfwP5pfb80aSA=;
        b=UvR9XinwW39yn7z0o2DHZuvzZK8VftufOGuWk80ftTExsGR5mnclFUaS34G7LJzzeS
         vH4HatDj/T2fB1JzFu4xxRqSm/gv8V1stTjPBFVB2lwHUibXzNQO9SJ23pCvkblWWIeq
         i/DwukV1ASV97dxSd16tNOP02QzBFId8d7n36/ZbtuPy01gm6fGpkRQiTedM0gUSgtu7
         U/t+2ccU1blHsHysVeDouRov5Z6M1Nglf4tRmtuxAHG9pjc+EkpSKKIHFhsANgFRG5Cw
         aWyU5KmSRoBxnlGlnk5jzHJyguulryY1GIomp1BnSzA6wV0RT6purg8pDLeemoZRlbeH
         geBg==
X-Forwarded-Encrypted: i=1; AKwUvBxFl73ZjqTUcb+V2OSvakG/7s7vq3Qabvqf7KSAPJKfAB9+nC/C7Hg/Hcxqx74Wc6AOGa6cHNUMeRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbxfVzkdaVbAxF3FUxT2lLNupcDc83E40kLRzIhpTUwJzrAeat
	K22jOHIjRmzLobIaAOKHOk6PgNaIgBahjB551NTrLCD75fAwd6Y1M13hId1/jfg8GNEPXVbuzCf
	f3RSa6goiGmj5e2M0E0iSzM+C9tCQ/LY=
X-Gm-Gg: AYBFou173qfkrPok1b9leUZQE/5wCvEOQttc/NLLCvnFfSxspfbS0jl9UED+627LX+H
	1LX9TVlCzWdCs80klEpLK6BQ6xXkYnBQCnLC2/MPTOwzGk+fZzfXPi4umHg2LjU6kMRh8nvElz/
	NTp74ICqm8/xyughRTJfZj8q2+emVU2Oy2ROhYlYf6ozskINnSKt9zdg4P6cnRxxEvy54axWQqG
	ccd0LcXye7RjbJGSTLGczNvaQ5CcJMtTU6XUfW6p6xes25qGaFLA6U0PbLhvLqm9x0XLd4NU3MY
	uRjDQpNtjAGrVJ6lbAvalyLIf9qwlqn9OzefQqiDcTluVvAEGxPSV0oHEJvnscE9x74RTUDyv3Q
	H6BVqStL7pH2GsrrTVlVi/nFxWgFJrJT/hAaYJkkSli+2S2o/W1M/0L4vpmrZ7DVPL87t17F8oI
	+XX9gbWOMmU4ZNSycF9m0Rf9S5VtpenE52B1gmnjwB++WBCxyOJ/ujxi1Fe+CfE0R0xV5BSWtLa
	Jl60lQ67dys3A==
X-Received: by 2002:a05:651c:41db:b0:3a9:7160:e83e with SMTP id
 38308e7fff4ca-3a97160ef8bmr1338601fa.8.1790946598330; Fri, 02 Oct 2026
 06:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: edur silva <cloudflare.ddos21@gmail.com>
Date: Fri, 2 Oct 2026 10:09:46 -0300
X-Gm-Features: AclHuK8bPF4GnX5sBMbPYz9BTv__COZ-QGta6UR72K21SmSN6S4HG0cToVWTapc
Message-ID: <CA+fnMJyOz5jNV5_ykqSOrmmpv4aeeWKODOjKLZEWA0Ep-pUU0Q@mail.gmail.com>
Subject: Re: [syzbot] [usb?] [usb-storage?] WARNING in usb_stor_msg_common/usb_submit_urb
To: syzbot+73c662df6e55838c6ac6@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

#syz fix: usb-storage: ene_ub6250: fix race between scan work and probe
