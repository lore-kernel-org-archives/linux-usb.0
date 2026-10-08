Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6641799F
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469368; cv=none; b=X5Cy4K8EpQSffMrzCD1cCNPCcvL/oDOEh+SxCp1uAQC1mTvbsYQzDJknJKAU859qINv+CDM9fnnfYYWmh+CpTvDEExOFwl2Tr+ZLcgHFdzTcNhGYokUp9MnAL23NohfsOjIxeHRPYZjNQnNmTyOaN+QsUDSe/g65skDKAHtG5QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469368; c=relaxed/simple;
	bh=bGvHf/Eu0Cr1bzhWZCCr+lmOp/ko/TJ9QQPm2D6QGx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwEa9IcGiqEzVbTiOZGinpwv20Lr6B2MRiBud/enhZpTtFKR5fK471gdtn1jLZQYMYlJlSMtVvOEI743ay1FJ9H2zlVuuSnH6Z4smZNGeT7ZDjep4suWoQIXHGYM312xpc3kF/pJzSvJuwK/W1aKIXxnqrmkdZjq9CKJnZ5pFv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UFTlx1Ps; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UFTlx1Ps"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917b78dfe30so44138326d6.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791469366; x=1792074166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Bk5WdlTS5GWj3gecV1hQkLvdo5DtdQs/OHFj/sJG40=;
        b=UFTlx1PsEYwrTmyDWUvKMlhw+G4Z50fFIvboP9M5xvpBHfJ3IQDP4gjOhzwRpQBK77
         q4UC9stQLQDQVyPQiUyuGm86Wwt+Px1Dj+2MERvql4xr9qDTB/n5BkhAk7et9oIzRq++
         zlpJ77NvLRUsK/galVvtmH+HiPVdKpSApAYRH0zfaJD5zmR5HHUIyHn8JxFJapbp73lb
         iRqn37yp3cxh+KVQGxVK/+nXp+IM9bcIBothGTEAiYKcmWN+JGoDZ0Tl8Ach3H0WhbOJ
         3Sko3WfLfbl8FgCL0wyCzPm4lhSlNNmwLrJayhUWiiW87WKEASQVUTDnpbxSTb/TQtpi
         aF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469366; x=1792074166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Bk5WdlTS5GWj3gecV1hQkLvdo5DtdQs/OHFj/sJG40=;
        b=MWdrzjE5O99C1fubXWlnAEuRiQZf5Mnabft92v4vhkdL+zxl7IRIwq6uHAXeDoqT3j
         GUuJ9QGjh2r0mTRoDr7vbOdHrKuGie1MKbF1QAeLNbP8GUDzvKHdEfM4Efcg29KWgjvf
         Tyv3mAv3DyDb7iKCsN9SvOI8ZBg6LquAVUnrv+L9+TjJeneOkx5AJ1QrnC+ZiEnVkcy8
         iQI2M2tp3KPJ8BZMbfBiSykhF+6GE5nnXgR5HYevvKwAPqsCWnOnHo0tBYpkCYF3p7W5
         I5djV9wF/rq0d3Py61sQe8eb1kcHAlv6bRFbuq7n+LsXUAgkbf3UyvEeSK7YQAbf9/4p
         shhw==
X-Forwarded-Encrypted: i=1; AKwUvByAzOSb6Oekbr1oA0i4b52ysneCR32Ibf70feDbI4I7aM2SqDYqVplQ8FfWcmT/xdoyneGqQ7EQeqo=@vger.kernel.org
X-Gm-Message-State: AFuF++mGTD16EEStL+VSpoB0gejyqZ8cibdKRhPq8VdqGBxAQVgzKzDo
	DsGeZQnAjnwl9G6ZN5jjM/i+3EzYBUQ6WYZZ1MkTnt6ylPsb1gnmBhcRM+XBVmL5Bg==
X-Gm-Gg: AYBFou3DAGRI7YZvhRSqatxWuE+NNSe4KiatacTN0igLV+GNGk6JKPOqY7U+otMuElK
	0q+A/60aamfP48QlTRLdEGfRwr/TeeWNKv9osDGpr0wvPYO92uJvdlv4S+ZlgWaPDY2X5+JCcqS
	2nubdTeO6vRxB/i1dJe6lz2S+Vyx6SeZW6A6h/mPP7RoyLJcqQclrVc0QQGHPmKhVSv4PGTnch7
	AZ0sNmNDiGyt0otuw1ps5Ynt5f/XuZ3OPMT9S0wyfP+91Ygf+5gSgRizYc9HnqsHgA3L/NLCPTR
	+AOaNroVFo7AZmTH63nFX0W3TX5/DQy6fhBJFDzaKrnPTvdY7XoBhn89w1LH8yaCuVqQ46pda7H
	ZVFTbM+IFF+fVugXaEENFq0javuBX3kOJVIRg9hvUcWao5hbweHQSvQCVI40WpKZgszNtXoVK2o
	gdXx+SGc7Ok8zqrCR7s3vvpE1jJp5FtpbiI3OJVi4ujh6NSTzQc9L3yFf+EC4L8HenJGqfKPk8t
	dVcM2E+zNH3LovcXnh0CgY9iTE=
X-Received: by 2002:a05:620a:1992:b0:93e:9807:9784 with SMTP id af79cd13be357-93e9b8201b3mr1007726285a.69.1791469365187;
        Thu, 08 Oct 2026 07:22:45 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991580d2sm488539785a.21.2026.10.08.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:22:44 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:22:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>, Zuo An <zuoan.penguin@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface
 file
Message-ID: <45fffbff-1653-45c5-8e24-d5a580faf5aa@rowland.harvard.edu>
References: <aseApS_MWoP3Jtp0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseApS_MWoP3Jtp0@gmail.com>

On Thu, Oct 08, 2026 at 11:38:13AM +0000, Zuo An wrote:
> A path was misspelt with the delimiter between the USB <config num> and
> <interface num> as "-", when it should be ".".
> 
> Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
> ---
>  Documentation/ABI/stable/sysfs-bus-usb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
> index cad4bc232520..400237db166d 100644
> --- a/Documentation/ABI/stable/sysfs-bus-usb
> +++ b/Documentation/ABI/stable/sysfs-bus-usb
> @@ -60,7 +60,7 @@ Users:
>  		PowerTOP <powertop@lists.01.org>
>  		https://01.org/powertop/
>  
> -What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>-<interface num>/supports_autosuspend
> +What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>.<interface num>/supports_autosuspend
>  Date:		January 2008
>  KernelVersion:	2.6.27
>  Contact:	Sarah Sharp <sarah.a.sharp@intel.com>

In addition, Sarah has not been the appropriate contact for ages.  Greg, 
would you like to remove that line?

Alan Stern
