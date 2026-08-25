Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC33F328F
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652398; cv=none; b=lhbWrpC7MWkMRYJwEkGCWa666kSpNsudGsu0+kxcsgqlF0rOhyE22NKi8igSotE8JU/tugsyegpWPNQGa/ugq67kU399xCLEBy5bLPhye919+HlRBCh2jKwNGV5EeYaud89khOzgMtuT8NETnUaMam1ihnninU8hPtMUKpD/E3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652398; c=relaxed/simple;
	bh=+O4TG5OTvpzqzT/cUA9OzfVxWnNFyW0F+ybzoMguOEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iITj7iOzNpgzPjL9FgSYSLqv/pXUjYNqP0rK64/0hYgXAiiewIZYRYV2Sl1GDF9CMQ6JxHbqd9RcCQLRWd72CbPNArz3nwbdcxR8Pz7QLJTzuW7FzNitDaIXYDMY7mQFOlZczoviXi/mwpPlpkPsM/ooA70Nvm5ONtCQH/cQe7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBbBem1f; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBbBem1f"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso50121905ad.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787652396; x=1788257196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lV6nQecXjHtcQsqEmzr+clL9T3RLWY/CJqTB6zRiV+8=;
        b=YBbBem1foyHKgWaNkHrx20djA9aNCGAImRlkSbjvAEKSQdYYry0Yui9/7pkPFexshv
         GbOAS2ShY1wyolYXSjYMivQiM5m6ZNRKw9VrzNTNGnDExYjWU4tm3yDTG6Dh7ABibuey
         n+6wh7RJGmkhO1vogtS0+LkrHfNJV2EwQZh5EoCpnv0+TStwutW6X19CpjmyPVlVQQv8
         o2apgt0PGGpWC9OjQejG5NIXJ85Fo1yAqaLXuA7A6CPZl0PLiQki1DEu1FjnHzmwBJKD
         JvPuKe18PAZkpMhJ6T/SRGRhEkgJz4brfM92Lj/1etCfwMujALIpyeL8uAoHU2yRcoVt
         R+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652396; x=1788257196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lV6nQecXjHtcQsqEmzr+clL9T3RLWY/CJqTB6zRiV+8=;
        b=oQWi7UOa9HLdl06qU/izCS0753bfn7p0Wwe/HJtRhQFyxIgpTtr+VeQK4sQwPkIxeF
         aUZcHD/iZTTaznUKzwscsRBtdY4kYfGfZKdvP0iN0V1TDQjd3AYLa7EK9xO9EXEu2JNF
         RroXjAW7a0U+f7Oy37kPEZz2fkyzU3qH7BA6YHytgHnsmJexjDC+nSSDNqqh7XkoyvHr
         HvzrccHpXoKtQoFVAvkiRtmp6ujxUGrkxeKtVuI/L2UuNLwHQtNqI+8fWeTaqBaaruyd
         vwNDjb7Yen7wx9G6LxSytAAdJIObkAI8mYWn+2Fzgm2Aa5kURoeUKdLI3xyOY07x4F2H
         fBcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp25o7FcOLn23JJU+gDhbP6ukPi6ZVvxZhzaieZ1r1LpUL1HXLiop3ZeSr2+csiRpHwIKcX9vYwCP4=@vger.kernel.org
X-Gm-Message-State: AFuF++lJeNiU2pc3cxK8OlqUlTrZiLtpJEFgz/msqstPtPXhNujq91Wu
	oAuYJOsIrWMoHCn399Gu3Cz0YoRg2ztjD5OE0cCRRUyx9oEpEMLx0Ub9
X-Gm-Gg: AR+sD12QKEgDyq4ZmolCn9ZM7dnXcaeathKncsdGWG7n1xIXWvWxeFBKultEWZ3Glk2
	wTNqcyhtfahZMbYxXGqSi7PRPYg75uhDzCtbylTowZ2THd/LVcTa6qfHyuKxnUCsBrlTbvx8X43
	/2rgXHpj9L9xN4jpgDVmVvEj7F65cVw7bRrtwbcxWPrDFfdVLnX0oyIJwlVg9rgcCiRHBF+e8RU
	n/6nYHYPj9QVikFDjMRyifsqHrqoKh6xKFxrmJ33AdEfjwbG0frUBrBgdT0nxxom7K/BuUvA1q3
	Cy8+4sx8WDW+CC8cavW0ZvuvmBxR9KiXKt01mvAOt40Zb/pmRfsr9v7dZaPTtFlyWwJ2RDNHf9U
	5fZJBnu1zIjHNo69iRuGTYXbyGG7YnGIy6L3roEqGJzsxBtY0eQS8urHT/1LrRQvtT3v6wZHU3v
	h8FapkHXMZeK6yozVp0fvAxSdGkLGKKh4Gqb0UuKWeFEJ8rfxsd+ndNDwquaiBqXfdItS4KyoGv
	cST3aVTTzTV1cdd8063z7D56BquizKe
X-Received: by 2002:a17:902:e785:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d64b0e2c7fmr671003895ad.14.1787652395985;
        Tue, 25 Aug 2026 03:06:35 -0700 (PDT)
Received: from localhost ([2409:40c4:101c:e5a9:a28f:e499:1b07:43b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f8e2a730sm37287178eec.0.2026.08.25.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:06:35 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:36:32 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao1ovvdPAy6n_F7I@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>

On Mon, Aug 24, 2026 at 09:37:55PM +0200, Mathieu Fluhr wrote:
> Yes. As mentioned, I first thought that the emulator itself triggered that by
> doing something that the CPU did not like.To be honest, I barely play with old
> Android versions anymore, but seeing that I could reproduce it even with
> Android 13 or 14 made me suspicious.
> 
> I _guess_ Google implemented a workaround inside adb for version Android
> 15 since using this version, it remains stable for more than 2 hours.
> 
> But, in the end, the situation is that from a simple user account having access
> to some usb plugged in devices (I usually add my user account to the plugdev
> group and use some known udev rules to access my Android tests devices),
> you have a way to crash the complete system.
> 
> > Opinions seem to vary on whether CPU load must be present or absent.
> 
> On my side (and I am here only speaking about my TR. I don't know about
> other Ryzen CPUs), I can't reproduce it under load, and one condition to
> reproduce it is my CPU going in C2 state.
> -> I did a 2:30 hour test using several youtube videos playing at the same
> time on my desktop, also stressing the emulator with some 3D Mark runs
> (as mentioned, I first suspected the nvidia driver to be faulty). As long as my
> computer was busy everything went fine. But then I let it stand still for a few
> minutes, and it just crashed.
> 
> If you need me to do some further tests or experiments, let me know. I will
> be more than happy to play the guinea pig here.
Was this result after applying the small patch I sent above?

Regards,
Lovekesh
