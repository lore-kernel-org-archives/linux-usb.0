Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309730;
	b=1fK1cR22i4Dhn9f7SvZwtNSD7Fkz/6qUFjqXVr0durHXBuPbohBO73B8STd6APOp8Gg9
	 eZ5c1gc+OK5FBlZaEr4X/fhbd6qpeweumICOI+2ydK2bJjVlh3/THWHHIP+UuqjEiWGUG
	 kGOgNQg1pmoCaBTiPZdjAO7Z/Pg6WG0P4s49d7GOQQLo6tGID+KY2ZydyN1PSPNx/neZX
	 HQt6f1+tviLOQLUe4xOXGwblfLsmIvM0qIKzgYQUy9rC+AuZ7Pq2NW9mptHC4uGkAIGiH
	 oKh6FkwIF6YiTi3QeO4Mag8cohzkoNuvbOA7GlhOnklj8NF6Gn2BmrW0sg6Ja9k0JiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
	b=N5UfJ/VcHkpSUFkHniWXq0SB01P3JE6vV2R47kwNbNJzkdEvjZUG8gX5Ub7StCouxkqS
	 prZWCmfmMj/bevW1RhgwYkErUk+vqG4Hm9Cx1V+ipSexKWKqrj9BOMnukM+8zteqxifpk
	 VNE60xwuh/RqG7CmvvFWNJe5NV5moba9mo6DcGROhyXlI6+9EA2hCgb7Th7KbQB+Oa9W8
	 /siCzPYuLg7hRkvY9LmoxXFmUUD729yVMR5n7jBORNJmkgwMLfZDAXCD16+CVeJw9p6zc
	 IK0cC6f9N7LVTnh5NOKFx3VAwfGXTOK5019pTydOg03e4M7RcMomVKGSonOacjT+Xmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPqS74x2;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822DC606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPqS74x2
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb681de50eso622080a12.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309730; x=1794914530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=WPqS74x2NUSC1tknWVErVJDYN/dNQGSgNh2hN++DSeZCzj7xEGWcYIMyaMK5BHl11J
         5GCY+COu5espLBEtyeUQNc3FBAcbXjida8XkdTvkjA7izRWliOola4ss7LiRfZKtwLab
         ErVzZ4xOjR8tnuLcCh7hgQFJ/z8tpJojKR6Ly87XdXz0oLw0ZSmt4wutVzBl1DkWXIJX
         sKvc5mftkffxfJbnwxxSOf2M92EBn3BTp3hcnOqMIpwD+vHwzts1rcKEimx2zYSrKpFw
         e9hCO6sravTaCPzSjjPlFBt1Vck0UH8pJIp1lRDm/W5KNJBR1A35mqYmM5DCdeSNLlyZ
         frFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309730; x=1794914530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=hSCQqru4p/P7P3JQRFM4CWImuN5vt0EeYF9kidVriWpBqjgqQKZA1csWpeU1CgPxY+
         r3oPAthb6drwaZtK3qQrAuEH9C+oPejVoo4TLf1IsKeOXoPLdS+pzGh09ZgiFH+m+zZG
         fhSWh25wd5Ts7J2dM/6w9kcgpjFk6DZRzM2Zmpf0Jojr14I7H7ajHlDvchZoAGhSo3ka
         khZ+T6UFu42qXU9vnJPd/O756RtcZSpEUyTudboVQ1sz81VKosB3lVxesjIou74EuvNR
         S0odL1ELzBm7CuU/O1Xr/L+6m46U054EpGMWRnJCfE/71WDVc955ciYotrEujqib/p15
         6c/Q==
X-Forwarded-Encrypted: i=1; AL+hErHsyv+fLRLcBySgNVov4gQohn7H7BniLynFRZDufrpCKitwwca5bmtSDIcwm2otrSILrD3YJIX7V74=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GarLzFvLaYJH1jbG7uE7iNFYtM/z2+LkPTPDhnX9xMGzRpJsO
	UJ62+wiG86wzwvrzUPaesph89r+plxi3/PdAbYpqG4wL2f4558HkXIBn
X-Gm-Gg: AYBFou0hf0PaXJfhma/1hV3iXtYfalgUvej3sbscFjLu4hMBLnCoxWDgBZedY4d6vMi
	Icgm5KYirP8cbwRMZ1RRj5X1GGl2XWmMAdKrkxU6v7kPAJA6kM1cfB+dKTSbnjfdPxX4tWOYtyw
	HX05f2ZAuL5l1ljJSPpUJv/BV/QkjMY4B/X6EfJ6l2IXp4TF9OB/RLIlezB0rw6Wqm5bV72M0+y
	AqvHWnnJFD3fuZ6NUVByCYAvTjGmiT53K/BA4kT1VxlX8weYKIytMAqGNxhuJyOsg72QfWoFzmR
	ftLKhqxzZUA+/JlH64eV6xErQxhhRfXJmmvjn7FWvNz2HVw3zmhW4j8gH8qCtaBJd8TQfDuQVkE
	ktgCtNVZb0OOLLvmUiRO3zejB5EzrgqozrfyXJg6+ZHoxe1ZVAPYOOxpImxXQT88WfqoIKeGJ2B
	DNj0l/Q3Bpydtr/bbovQhxsAjNVq8lOTQgXrDkxsb/O9wlxxi/VqjdTYBoR5Mf9hV2VMLbdvQRq
	ktXNqb7Nt62XHz0n6dO9bnC0FJmwusStgtTKW8IMIGjScL7/MiPlKRbtByYo1LYjLphsx9y97U8
	dCMDajAGpdQTjFHto1rvvpG4gFo=
X-Received: by 2002:a17:90b:1641:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3b166ce8601mr2382151a91.50.1794309729892;
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1c0csm3413913a91.6.2026.11.10.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Date: Tue, 10 Nov 2026 19:21:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Minas Harutyunyan <hminas@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Longbin Li <looong.bin@gmail.com>, 
	Dinh Nguyen <dinguyen@opensource.altera.com>, Paul Zimmerman <paulz@synopsys.com>, Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on
 Huashan PI
Message-ID: <avL-KigWPepz-Z2A@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-5-inochiama@gmail.com>
 <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>

On Tue, Nov 10, 2026 at 11:41:37AM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2026 08:06, Inochi Amaoto wrote:
> > As current the DWC2 support role switch on CV18XX SoCs. Enable it
> > on Huashan PI.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 
> 
> Best regards,
> Krzysztof


Sorry for this mistake, I will spilt them in the next patch. Thanks.

Regards,
Inochi
