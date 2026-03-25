Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A33B8937
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434774; cv=none; b=mU2oaR71uWIY1hghrjl+UTrIAZLgDxPC6D7QIo6lN9zmBsnCQ8M3KH6glMF/uNDA62wugcQNNnJOHmLWPZ6JBBeFmcit9PDpMNVyvPWJ88WkB2KQVvlVu9nG7YGMyQja0zCqNg577wqdeKgKgNkM2y9PgkiKQNzJVTGWE4cARwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434774; c=relaxed/simple;
	bh=FGGdrgKC/Z+YvdCUWQsTKr2aqUW0ST6EG9paGHCfwFU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKQLOr5G9eeLvzfF8xQia+5LUbUHMD0w+FH52F2GB/xYq8ySobd0WLe2/CBZyGRqrTnp7WUobbFGgRnipVSKoQinZACR12hkbA/UyjkxTzI4AFo402APwdARJiU+aS4BADC5Sffuj39VEvVUtKflDOw2STwue/BspR31046iEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll2Nkv5O; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll2Nkv5O"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so312630666b.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774434772; x=1775039572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVOMnkbYwEL8fVDgn1ygmPBmgqD43enQpHSoLRimEuc=;
        b=Ll2Nkv5O8YjB6qt4aWt7Wjmh+yCSf5EpmcK3v9DoBn/6Y/Hg6Rsr26GVAKpyVpv79n
         qMl+RfRCUQT0U6xUYg44mjOEnm0acf0vGEpJchXYMxjW3aRrPXumAPW/4euv5PBVq36e
         eNDaSq/VfizlvB+REmISqu0Z5G0CgNlpiJ9pYqaTS2UyuD4wxH+X+LmVYQWQ0xRPYpWE
         wyMi9uyOR4e7o2wj4hJz7NY5G7eSgDSu54DoVtz3NkVDT9Eijt8IrYZiam+yW1OOjz6Z
         HX8swsJM9ivTnOoqWLQdVJ56dg1ejel1oLgTiNnXDjlX/NT03iOD3XiAwIemlQG4B3r9
         gx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434772; x=1775039572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVOMnkbYwEL8fVDgn1ygmPBmgqD43enQpHSoLRimEuc=;
        b=SzfIxBC3IfAjSXONgQjb8CyElssUPZMHfLS0D4jqfSPGFalSQL9STEOT+yvqoDzDnE
         lNtGfqyEiYTwttBNJw5OtiYL4OoWEv9aRDOVV16xJwfDBJfcIsgJ4K556aI4CGIGaVWf
         X/p8/Re/5xGLlgqtBCHEQCKmfLlSX0H7JtPMmPS14EJloqi2ZRO1t54/goj4C7UT6sWT
         gd9nk/DWh0JJMbmFrExNwZF6BHwYMgjQv08UCImhmCpe9I2A9ArwZZI+lI3V+cUsvYM4
         WKEdvGTizTAK2IsKrvGVstv0kGD/oUa/nLvIzVEy6TZvenAH3ImUrC4pangUZxrMeHNh
         AtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBp6cnGYFwy2VMasFnrskGt/iELlBuKbaRICVNosHxsB2rv0eeF90nSZbVksETrKdQfqBMV2EB7aA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPB/Hj9WYVajjgXEZPWfELRpvl22s5HLM/75XpIGtSZeyhMIR1
	Df1KTEJic2hI3zavWw3iywGnRWQMKGjbsXhFsp2y45TMVB35//jO4d+PDF0LPQ==
X-Gm-Gg: ATEYQzxIquKu5rNFGSKizAxLG0OuRc0aNK8xbKQ6yQJJkODbLVRXSA4awsJNnVKHrsI
	/XGBODXl3EVe5vpg1U8+AAtkMzVUkD4P6E5pILd+TNETK/dvy0NvKLmGqsuQczQWva+YR8eyDxM
	A7jgzTGWPwjJbk3d8SVgf/3xz5k4/zCxE11dp2WVqKWdL/gRUhwI+E3jelPO0TBnoYsqXxZZI+l
	V8OvtqvG0f//onvKjy9SnfkKJ/LKnGQ6ypqXBFTY+UcoFWy9TIMCoC3gTX92vdiKmn+vekyLJu8
	e4SioxCMN5LVRpvfNTjQ91z2gai2DNDPmEisJiG0GMnNGzmo87H23dT6LXAglcVqY/h8cE40EyO
	AfGyQroL6cXcZ2LX4h1cBdu3vosfj1B5aTtSPjc4RImbudcxWnlnbX0pdi1O0UgOniIR4uK4pVn
	5S2KbYMpIVy85vWc7N/3erGPafGnpeCgoe3Cg=
X-Received: by 2002:a17:907:9605:b0:b9b:1b9f:8397 with SMTP id a640c23a62f3a-b9b1b9f89d3mr21027366b.31.1774434771237;
        Wed, 25 Mar 2026 03:32:51 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de16csm782729666b.41.2026.03.25.03.32.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Mar 2026 03:32:50 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:32:46 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Xu Rao <raoxu@uniontech.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix debugfs bandwidth reporting
Message-ID: <20260325113246.07681667.michal.pecio@gmail.com>
In-Reply-To: <d9ae5a8b-3aa0-451e-8a42-80ef73e2d210@linux.intel.com>
References: <20260304114928.110be4c4.michal.pecio@gmail.com>
	<d9ae5a8b-3aa0-451e-8a42-80ef73e2d210@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Mar 2026 23:04:38 +0200, Mathias Nyman wrote:
> On 3/4/26 12:49, Michal Pecio wrote:
> > Replace kernel USB speed numbers with xHCI protocol IDs expected by HW.
> > They are numerically equal up to high speed, but instead of SuperSpeed
> > we were querying SuperSpeed+.
> > 
> > Gen1 hardware rejects such commands with TRB Error, which resulted in
> > zero available bandwidth being shown.
> > 
> > While at that, report command failure as IO error, not zero bandwidth.
> > 
> > Signed-off-by: Michal Pecio <michal.pecio@gmail.com>  
> 
> Added to queue

Hi,

Thanks for taking the patch, but can we have a last minute swap for
a v2 or optionally v3?

Problem is that returning -EIO is common (the command is optional)
and it upsets userspace: "grep -r" spams the console with errors,
"zip -R" terminates and doesn't include remaining files, etc.
So I would prefer to print an error string in this case.
"Real" errors will still be returned ordinarily.

The optional v3 also renames the new directory for consistency.
Technically it's a breaking change, but I believe it's permissible
in debugfs, particularly for an interface only added recently.

Regards,
Michal
