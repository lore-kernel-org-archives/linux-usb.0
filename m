Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7A3CF1E3
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 06:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786860716; cv=pass; b=keD9HgbIgZiCDPzJRv95Hn8i1MRn8ogyslp1ukudPCNt1LkQZh4aYtbA/OaKAWQWEv3KsfFRVFTj3znvu8Rp6a4SFi7uL5m0TeaY7Jfw5nWEQCBOpThURefv6LXyYfmpUrxhotFqVsbJeihdhwp4tdkefNMBEtcrTiD3T4aGxUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786860716; c=relaxed/simple;
	bh=X7sTe9fAaQ+e1Hd42kmuXVAg7k+XMVq5DlF/59+WCjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lns820oaZ/1U07+8kviTIpYaqeTsvrFJrsYKe/lcuFkr6sCnhqCka4InZiASaLrNBLK/x6zIHKRipV9KVj+xbgeaoqh3jKMK9fApwq08R2BsaxJNsfpUZdoxs/t1zfiz7vY8angTh3n/is456Hoo9I49EB+fZa8BpMfI2IRECfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYDDUonq; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYDDUonq"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66c5101a984so1782889d50.1
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 23:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786860714; cv=none;
        d=google.com; s=arc-20260327;
        b=LlLlCe2AZzAhcn0C2KUNfqNrkQaRzeVQmxrmOVGNEZBpruWjfS6oDEVeXm5esiRGRq
         roo5h50LHWYortwVSWrTp+1c/M47NsO2644o9/enSN+ryaPw7tDkT0+JuBKnMIaKs+Zs
         99QvnlOr4uGBdN7+FoS5ikCUQXPeLMz8OIiQCcSnercka/qkLxdvMl+wbMxTvx3leqjH
         7CeM4M6CpwA9togt26ZOZwJ3D6dqU+Y5nIOH7K87vujfwsO7Wte3e/dlhb4xwRVawMD/
         ZGDWmrbGxE4UImKqphd05AsuZtCHx+FC8RwJg0tmDSsTxYi1xOaW7/MqdZIm1zdcZEb7
         vTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iH5MCGHwPTj9XikT4F4oyjMZRAIaWGaMMU2/DmLs1Fw=;
        fh=gU87nPL8PKZFfs8iWaX1Zv8DzUVpVUW7SZ1WegH37Xw=;
        b=lVEPkNY6fGamY7Jb2ie2PR1TcBaMacBM/20QabtmRvdiyU6SWTT8xxLzrGpVY9szTC
         RRXQExn3fGdBuwfxkOLOHxK6bUMkE7lw1iVqFcjF+d3B8YzAqMt4xKGGgcBmRPnrpZJb
         FBgT7cJmLJ9IIZ8/Deoa7LZFQBuRVqWbNToQIfhB2O0dlVyu5JUNypQlm6Zn+fC/XfBb
         33mW8Ip3CBBIKjEEKK2bBOINKQCi1t3ePk0GrE9dWX4K8OZ1myxWLZdFKa4FKTJ7V6I2
         iCSGOLGhZcUwfAAePjXFyvuH2yiICGnQKDizHhYqAwl792yPwt2NxJNgZrmWQnsGzdQx
         fU4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786860714; x=1787465514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iH5MCGHwPTj9XikT4F4oyjMZRAIaWGaMMU2/DmLs1Fw=;
        b=RYDDUonqGS8RUdYtKfVx+wWMMyvtST3yE5sIr6QSgvCEqBRgwKPf1+KiaUvIG8qwfl
         xxJm1Tqw0yfafQ+64CTqLCAtcgGa4zfE55K+6pjFQ6d02tH9hupRE22typvQPgRsm8Rs
         IMlioFSBD6ZtMYXWP9Bb5HrRxHNkswTnvAG6YjQ4E3m93KljDSnCvI59bRr3HD/72W/4
         lTtHzsYzKue6mcFb7Fls4MOMQcBhYUhMSxUBbJHUSUDIMdIQLgr0TDr2AxGqh+yg/Afd
         Z8zVmCLQPMmPslLYD7+NOMua29ZUNxsINSGQ2depq0sNmFAgpUT2a8E/dMbhQ8YNuQbs
         cYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786860714; x=1787465514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iH5MCGHwPTj9XikT4F4oyjMZRAIaWGaMMU2/DmLs1Fw=;
        b=C9Jc7kFzEhkFfANizvS1H/1n67wFys8vJetVhvZPEd0scQZtcDvweGtk85Ox08nxA4
         xuR7lSuRujHvJ8SMoF+vmMsR5kJIt8bJtEqtmI2JXGDI8Km/wan/3nUBlwwpWadBErN6
         KptfrkV2w6LX9Ogu71vaiPeoTz0r+nS3iDO8M0wZJwDuaCc3+OJmiq2srDDpNNc0B3j9
         ifRBFAreJS1wvjsYDceE3bHt2pvBlVvtLNqjiJSYtqXxVXBjWbL1mrnNDatKbRAOdeTK
         pDGKmQLUwV9zDIXB4eha8GgqTCFoPiLkXj/eXPYOGBWDObyLAWKujbm2/KaQdu9eabU1
         gQBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq54Ikg/hEAgTG7dCuYMmLMM74PrsrdFM01sdHy5rMnFKXCpfsuL+DJrbhQWfy2wGwVsxk+b5p4Ig8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrG8tWPi5OmU3v6VF9qdOJR7Cb98D8EKhhHBV8DIxwrFN/EhYf
	XavjwYhV9OAG6WPnpkKBAjP0S464aGsl6bipT3HM4SHlcbIKcKyivmk+i7uKqoLpzWVmX8HAKuV
	Zi/Pp/AUSjM8xBAkez+aQWHZgHLoapec=
X-Gm-Gg: AR+sD10sa9StEYSUWWGQtrM0jIr8WZyjzlKear0Oq6fe5FoxEkpOg+d48YFUc9+Kho5
	dnkPQGAHi+9FQzDLpqhodRr2DrzJuisxkGqKXhUyVLRbBq7LCJWb4TQbSYCPHgANS4sy/YAJbw4
	wssCXv0QiAoJivqICG3IwKRrc94+VI66+pc39wwo6LyU1dcNgUd0JB3xxwGtzeY0BxDeKEXnw26
	PEXTVWJJPyx08SiB8GjzysrY+Huofd2suQ4SyF5il6nFwYzv+ojKguAlAUenrlNvs4URkuKwZ9g
	cUHrUxx6GZc8eoHxTse7Kd37tWzsG6ElYYdtnfLIfFd+xr9HHPTA0vXwGD/FOblMRFTz8GEAzeo
	ftP2WBe3A14I9kExM25nBOzOQHZbY4A+zpg==
X-Received: by 2002:a53:b68d:0:b0:667:e855:eccb with SMTP id
 956f58d0204a3-66c72be4aa8mr4388540d50.20.1786860714386; Sat, 15 Aug 2026
 23:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816015051.13184-1-kartikey406@gmail.com> <2026081646-sixties-fade-1359@gregkh>
In-Reply-To: <2026081646-sixties-fade-1359@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 16 Aug 2026 11:41:41 +0530
X-Gm-Features: AUfX_mxbl2LS9tBzL_cDi1sfNRQL_ko6m7_EegGjR_6N3gLNRFyRABve9B7Dct0
Message-ID: <CADhLXY7UWkd_4wNVSjxQYOVP3GeBZcDA5iiOBoZbz9DXn993GA@mail.gmail.com>
Subject: Re: [PATCH v2] usbip: vhci_hcd: let the driver core manage the sysfs attributes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	yuyang.du@intel.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 10:26=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>

> >  extern struct vhci *vhcis;
> >  extern struct attribute_group vhci_attr_group;
>
> Is this still needed here?  And can't it be static now?
>
> > @@ -1565,9 +1546,12 @@ static int __init vhci_hcd_init(void)
> >
> >       return 0;
> >
> > +
>
> Extra line?
>
> thanks,
>
> greg k-h

I have sent patch v3

Thanks

Deepanshu
