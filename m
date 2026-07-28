Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6053CAA59
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226052; cv=pass; b=edeKBANJ+sMdTvILDP3Z2UJkuzkYFgi8tfow46eePSculN6dwCl/EhrqnDz4D4ZIbppjnReilD0soLEMYfcl192K2jcD6AMbjVA8d1VRHkrLudrwnm1ikee+pNvEFjSOf0DwEoVsk7h3x5lBPgXE02e1uIFREBu0N6uxGjVdv+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226052; c=relaxed/simple;
	bh=qRwsuO8pKZEBgpKHZPKea3lYwnuotKaPofvzFKLVAUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QckFBgfD4ODJCtKkGjk3in2Fxy+50IE5HfceENro4G1U8Juqf833f/EbQ8VOd53W3SNqxBj/v+yv6C7P/HFZ6qzFcoprahfGcM1ft4iASREYQaEyTWD7u+RonWE1bYCeZAxc6zogRKJ+KcZcFTfSX43qWfg/U6MsgLBkCZfsb9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR9tXbvL; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR9tXbvL"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1600d040e4so105189666b.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 01:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785226049; cv=none;
        d=google.com; s=arc-20260327;
        b=K8glNK8sC4qQ1XFIrSCNM/eRWJgKGv/n00yrS5CgBXLLUFFWJH8DiaCnLXQz9+5rdU
         6Sroi+uv3Dp1XU8GdQzWbc/m9YUXVynZvkp7+RJyOaBmLV2/XTqPqODX6WoAm1SaL5h4
         l1kfzwgq1farKBLkKOmVQLF8mBag0xfC6TBAXU0uF5bsyaW4H1A1sgmAv4MkZaQlpeXB
         VvZORyhgPI7qiNv6lrMAaXFYuD4r6xvptAxx5ih5oRtD3gXDtrDuCi3ovskiTp8rEQDc
         Fpz9Rkzcgo0boMsYnvKA+hfcHaVCWM/4NZ9uZJZfr4NQobPuqFI41MTi/07m3ndFnar0
         UBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fEGGL3Elb++drr7wb3aYv/uPpgOidlYHaxIguDJleAw=;
        fh=5nFng9UGwtU0f2ud5raj/b7OT5yaHnJ1k97VG3cUV9I=;
        b=BUvLI6s5YCmUv6uWhvudTfwzOr/YCxcgOKXL6FyLztgzWj4OPyfDmN1Oq+fRU3gGIi
         iv026c6Qkxw7hmgcSOjCU9lBy+Xe9QPzuB4ucO7fzPiI8+7V9oSHSnH98UlHArN9ei2M
         DrTZHhWYcqUvXWltNJwwDMdzYW1ce7F9320K1oX4tl1vkkEwEAiyAE8OLax/i8aW5gPZ
         AwSzyS+dTwolW2Hmr8pvNVsmUfMER1LgO5ng+1y5j7DmeEsVK9u86cQ01/mVo1ag9p+l
         jDuI5ylhrD/A/vzEW4nExTcpMIIk4sQOtGJClCwedwnqnuU0QYqQM/SG5otwwjT2AzwY
         CVnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785226049; x=1785830849; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEGGL3Elb++drr7wb3aYv/uPpgOidlYHaxIguDJleAw=;
        b=ZR9tXbvL3zRnm4GCk/p2pJCKkf+zr+NA3FGXfnAWHk5RXgQrrLQfYYIzGk54Z36vPn
         l5Cc43T0UP0kjegz9W/DJsLJwzJteJ8/6Hhcn+CBfTwT5IirEmQ99Q8zPpxhaiCs4Ciu
         cEE+TqYxJArRtRANeGxjezUJeWJapD1Uql7JkPSVFPAUBSPAEAtsTY+nA8yuWwOP596l
         UcojEf4sDcc8aVL1+i4sSfbff13WhooPnS6k+8MKa7VvssLpc2Ahu7rKLZzo92o0LrbJ
         Wy3nOV6L+tS8Wd9Kt8aHOMqysijjE47Ufz8h1CNSyMTO5aOaw3sSCAiwfiaF3limNXvC
         3qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226049; x=1785830849;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fEGGL3Elb++drr7wb3aYv/uPpgOidlYHaxIguDJleAw=;
        b=BJeQ7hjGUs7y+fO7LAHxnHJhKXQvwlj8w6S/CYuZwntcV8Au+1YDh6M6z3UuMjCg7A
         I0xLaKsPe/iFFFxEiLEwGzdyfIRSlvOU/WFd/fkI5GlwqabLQDqIw5ytuGajxKtrFLBv
         3uLVlsiOTftwdwrlHEzQlomXX8VlEkpxdv5h+1NnpxI+kvoWET0OuOAKB05RT5ZrVB4J
         uuEnAq/1RkvAwzt/WY2ileHHvs+xVzAnkPYoF0HnSrNoaR8lwl/GffxA53AD5CzGFH5h
         EhKUdYo5DxnGsUzljYkd76oMEME7/HEPe89q+H942mBAfsQsbqBST3ojnSEPzzFuhSfO
         fxBw==
X-Gm-Message-State: AOJu0Yw/wbSuKaSKtZEv5HeNAjd2z5YM5jj9MCrQwVGbhw099dwalGBi
	rhRJcQYyCLb3XyeqW0haLREheN1qDptTeDv+OCVeR4FEMnaLNMjSiEQg9y5kvHRDm09+meuyLBj
	XDAsxmIJdSBLKrXxWYo5+E2+f1dyLMSQ=
X-Gm-Gg: AR+sD10fXXa7DBLBVDBHc3I/O7QhmSUIesHXsKhZFsU03CNZLf42en/qmWFPiYLu7jm
	WwsbS3ZK0Slkced8X42N3KjrSYBX2rMr+zrSWwt9gWfu1y8DSTcNCvnqWoOgjp/dVwRtDPnCDqW
	5hkidgKU65Xlih7gb0Teh/G3L6byoGcSyJruEOkI8CjxaEBI4P1FqSPFoNwTJbliS8Yq3q2te/D
	ymeppKsfqRjLnXejvhAoXP3RMnK3q6fJNj59+5mNI7kfaOfgzBgt5IPv5J46btav+i+jxBdHLE4
	qFi9LrORqSulnIM3i6qe01ZcP8C11otZjNPOjK1db45Ehkwtuf+LeFl/eQ==
X-Received: by 2002:a17:907:fdcb:b0:c10:10c9:6d8c with SMTP id
 a640c23a62f3a-c1f720a90eamr66932466b.28.1785226049111; Tue, 28 Jul 2026
 01:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727195434.14626-1-nikhilsolanke5@gmail.com>
 <20260727195434.14626-2-nikhilsolanke5@gmail.com> <ba2af6f4-0134-4feb-addc-24694fabeb10@rowland.harvard.edu>
In-Reply-To: <ba2af6f4-0134-4feb-addc-24694fabeb10@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Tue, 28 Jul 2026 13:37:16 +0530
X-Gm-Features: AUfX_mxwgoB10C6jwdkIgCtlIY9774y5g27eciij9i__LEvC54eIcyzYnprEzjw
Message-ID: <CAFgddhLNOVPqnZW89W8XvD5W9nOPK51grBdraOeQcCe1_+WVFw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] usb: core: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, stable@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jul 2026 at 07:29, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Also, it's odd that you add the quirk flag to the kernel without adding
> a new quirk entry for the Xbox 360-compatible devices.  That doesn't
> have to be done in this patch, though; it can be done in a follow-up.
> (But note that without a followup this patch doesn't actually fix
> anything, since a true fix would require user intervention.)
>

Well the device I am using spoofs Microsoft's device IDs directly. I
avoided adding it because the official xbox controllers work out of
the box. It won't break their functionality, but it kinda falls into
the category of "if it ain't broken, why fix it". Other clone devices
use different VID:PID pair as well, like with what happened Ishaan's
device (his reply to my previous patch revision). I believe they
should be added here instead. Since there are many such devices,
gathering all the IDs would take considerable time and community work.

Also, the kernel's own xpad module is slightly behind some changes or
so I have heard. There are a few community maintained kernel
modules/drivers with many changes that are required for these devices
to actually function. There is some magic packet that needs to be sent
after the usb device has initialized along with doing a bunch of other
things like mapping out buttons, etc. These drivers are also required
for a device to fully function in most cases (the builtin xpad also
works in some cases). So just by adding a device to the quirk list
wouldn't truly fix it.

There's still a lot of issues that need to be addressed in the kernel
driver space to "truly" fix Xbox 360-compatible devices (majorly,
hid-generic or other drivers claim the devices before these
out-of-tree modules due to race conditions). My patch is just the
first step.

>
> Finally, a really minor nit: The two patches in this series are
> completely independent; either one can be applied without the other.
> That means they don't really belong in a series, that is, they should be
> submitted as two separate patches.  Obviously that doesn't matter at all
> in practice; it's just a matter of principle.
>
> Anyway, for both patches 1 and 2:
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> If you want to rewrite and resubmit them along the lines mentioned
> above, you can add my Acked-by to the new submissions.
>
> Alan Stern

Thanks! I would like to know your thoughts on the above points as to
what should be preferably done moving forward. If it happens that I
should send in another patch, I will address the nits and add the
Acked-By as well.

Thanks,
Nikhil Solanke
