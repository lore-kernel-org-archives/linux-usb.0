Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC653EAC61
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539878; cv=none; b=CMCqjtKMcpLS/QzV28nSLcsrjHNzYo6i28LOMQphjCU01bYG98Rx5qHZ22twidKC5fJ7nMG8FPYnvbsdqMYsNIlAOETqdlNO7h3OQHDBdgDciQx+mOdlXebI8l0VcLiH5vwS9lj8/k0zhOGR0JY66Jiq+kLwdCYo8SKl1dEPFaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539878; c=relaxed/simple;
	bh=7I/xFYkY7+0mS5ll21QwcU86qNGEsbPw4NYV9kYR82c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L84JAqOh09vmgMKYgO/hGGidMF3tlHsizdzykJjMkNKr84kRPrgdVEUYdImpEeFT6cLAlHEiGWGx/Mwk6r2liTx80dlzQmCYP91MGUtalp/SM6hl3L5/yudME3gLCR5X07ng6VfBySjL5JFw9jvQb1jmu2KH3Uo6WB9LRPs/XJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=L0L/H1hG; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="L0L/H1hG"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93959320373so97076685a.1
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788539876; x=1789144676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0wotowGUAlVyDXcwQ6YC01kdL7EaVM6537iZgo+eg0=;
        b=L0L/H1hGx1LGRSNrKFv2VxEq2c0w3pfTtDYcr3f5GD38exH33argT+heWhpCnyZvvF
         oJXGwe28amMu3QjSeb3lGpaLpENjtUozbFWkKKzl3NToMkm3eRk/Znql6ipppvWNRkJV
         rylZxUBTAV9DYGnK9qQDgVnJx/tJUP/thfNCHOsryl87zsszKWydmNv5uddxVTm6WjOs
         yn8P5bSlJcqCiwb66TMG2usYJ7+M2MWDGW5ep47kwHnup8PeU0H60aTnkMoiB3mtd3I3
         2Jb6z6HsCIL0Ot10pAuc7mqOlCUa6WOC19bP8p4D7k3rIRjmPUy5bX5taxSj83nYT3ED
         scqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539876; x=1789144676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0wotowGUAlVyDXcwQ6YC01kdL7EaVM6537iZgo+eg0=;
        b=i8OKsCHgnJNyn194nOPtjLnF4GHVFM/BrwhHyHTWoS4TNq8sv5E5gWnlAp0T+KSbI0
         bttSGHsbFEvU/Ngih4YwuK+z8ArCYyGpNNJbTT1D2Ruq4gxbfGUoRyfI1CNXDvPJ4T+q
         XxvRRdaKVKjkFkKcc8Z5+GkPZjkfdBlsBAaAjEcakZqWeLF/CqHWybkNm1zlkThQxuI0
         brKSq/ToBFc9Xe6Er3z4u0chxQVVc5fNWdKaK54ADsoSbteUAwCei3JRGI/9M5NoU+7Y
         YYnAWEMPuxE5T6e12yUjrSpDHmXsANGF4zob+jkxRsh3lpMI+8mfvf+KGB8+TEs6sV1n
         CazA==
X-Gm-Message-State: AFuF++kJxWSb+ndl8z3wbgAfmm2QaXgLalZdwTSL4z0y53Qx23jMjOCs
	Xm/u15bmmV6L9xKmEPJhYsCrS/nesdZXlkvdCm0sF5cDqEldKKb/rjdzwm4k+25a0A==
X-Gm-Gg: AYBFou1fPPaqU+ouU8MYYcFSIKsj2pmnZsd/ABeH86zTgo/qENaX66+fl6DGLFCaNz9
	4b/hNZmkA++fAoLaQWDS5CGw+JP2aNODAl+JKv4zXUDXoiDLETmp+Derc14lBC1gRjNbn24HWVt
	+2MJlsJ9SqanzFmkG34z1BOVeobKVShN4ddCPBMF1/G6cupcR0azuYpgA47gPuITQHxEPeB5Fy1
	29OMd94Yhz459rjahgzI1dSTFZDQBY8VH82fjNuVOiMRZ55SbPhjfhQ4lRKEfNu9LnMsHNZAPIg
	zy9vsSrLZ3LwEa7tVoQvvCKbh7zx5rAOLaOsYBHoMwgYbKGrMB2NNCLFetBBdBj+m9YzA62HYe+
	t4q0SyLS/NnOglypEEyk53rFEzfHptJmwXS5JcLJTWJ+aSDhIlJQDEi2C6Sp5QxfIa+tL9sB+b+
	5amogaSnsbSxb38urstWH2/gawBc7mlgP6twAPmvTJivqTBAFlxGfOo13mCICNnqWOE0gNZsw7f
	OI=
X-Received: by 2002:a05:620a:b08:b0:939:46d2:9673 with SMTP id af79cd13be357-939802f8308mr505214885a.1.1788539874627;
        Fri, 04 Sep 2026 09:37:54 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb2fd82sm247461685a.17.2026.09.04.09.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:37:53 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:37:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: rivaldihormat-debug <rivaldihormat@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rivaldihormat-debug <rivaldihormat@example.com>
Subject: Re: [PATCH] usb: core: devio: add defensive bounds check for len2 in
 do_proc_bulk()
Message-ID: <c7e44f01-75f2-459f-871a-588f51a05002@rowland.harvard.edu>
References: <20260904062958.19404-1-rivaldihormat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904062958.19404-1-rivaldihormat@gmail.com>

On Fri, Sep 04, 2026 at 06:29:58AM +0000, rivaldihormat-debug wrote:
> Although the USB host controller hardware prevents len2 from exceeding
> len1 in normal operation via babble error handling, add an explicit
> kernel-side check to improve robustness. This helps prevent unexpected
> behavior in virtualized environments where emulation bugs might break
> this guarantee.

In the kernel, we do not try to protect against all possible hardware or 
software errors.  For one thing, it's impossible.  For another, it's a 
waste of time and space.  Especially if the error has never been 
observed to happen with real hardware.

We also don't try to protect against problems in emulators.  Instead, we 
fix the emulator.

Alan Stern
