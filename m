Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72D9313543
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220666; cv=none; b=GhF13NfRRvvMYTRshdF6yQ3aRMpLtrubGvTI7ZK4Z6RC5KYlaZBdobucNOL13HSdg5O+E07zpsBJXyX0SImLjaT2QwMma6jsRvAnSbE4DfqOysQ4Pj4LQThvIPKJun4XhPEPeyuoO4ZFn1LiDuGTdgbNvXo0otu5tX/w49HM9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220666; c=relaxed/simple;
	bh=IE5sT5CFflgNjiePovqg41+2aM8eY/bFlNMgCLrxHXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qbdxy5LVlE+7DKh80UW6IO5uVr/Yi7ZyG+0A1sc9sH07a2uPSxaXT1dlH7WM4I7ZiceFZuXJ+QRopPfkOXg079CY6INDGFVD5KD72KMzWKxNKj3KSBgTwp/VmVyhrrG/PI61aWS07VUpMY1Me/r5vLQMqla4rm9vdhML1WAGLYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kMhYFPej; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kMhYFPej"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-488b3fd8d0dso2294343b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 06:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782220662; x=1782825462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hgwmBiHtChacwN0HIN+HC9h/6/vpUYCVSBJ/q583oqU=;
        b=kMhYFPejsw2Jf+dbTJ66/q/PjT2X722H/6gg3FOonZ8Lo5IuNoAwYkNuTTJR+zs59b
         481eSGBc03QVpJRGRSg+qdzz87HzIzcLPEghXnK4cKsKXrT3ZsAJpFL/Z9iie2GxX7wa
         ++jEIRVqQsyd/aUgr5Gg3+IRImnGyPSgDORzzNwPGz9ZBstEPC57opGn/K/lHka6vcsB
         79nDNBb0xNjAivOE6fbl/iZ8PEgu4GrTI0ynvHhTf3kE9TF5Ktd9wcu1MtLVq1sqmW1z
         5zZJKxDBLB8Za0LODQywh383tVJqEZuiSSmY+ENMnhO8n/Hfzubvwz9jDo62eIJzJi96
         ibVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220662; x=1782825462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgwmBiHtChacwN0HIN+HC9h/6/vpUYCVSBJ/q583oqU=;
        b=jtP0m+WQdS0nqXolPKKLP90ZzXL2ZIiLt5DuFgfN90Sj5xaLXcUaNHC4HysIIIakiA
         Ss7brt5BibxjQq6h62b8gxLz10upFLd3HfSlJ6Q3WVM+slm45rbVGXFydwghANmi7i5s
         /dzm89Gl4pdwBu8ojzlVZiq6q/smBkGzHIiQlUHPBBUcxw6TUzoP4AHImaLgrZM863ar
         TzhXcmJ3TEhc1LMfQmrLpcNLH4FMsBUBGSg0D6ZVpGmb0Lp2s7+SwLu/q/hKXY5o8MnS
         2EtEwV5L6/PLYNpq2Mq4krZVutrzI79gEGM5/GWbozmydr6l6e/fdw+Rne7qqvny5fXu
         jrOw==
X-Gm-Message-State: AOJu0YzHUsyKuitLdJnGJgAJdre4eVcR67xFfWrrWR9OGY1HAITRpHTp
	GethD7iVZavuDTIxLr8JPKD3iGCxs6RmLLDctYARCb9ziZiykVsLsZ3Qh7RuRBWteA==
X-Gm-Gg: AfdE7ckoDJW8xbdOR4gHZxysFill3rJCwjf0Fh6F/6vJSQMfbCiqqw9TJ4magvtUJID
	UIgzOC33R+HqAQFlHuyKs+D4/7JbsxT0wh2fuc8uy0KUaQtk3fKf4E182ysfx8+yjBMRZ7H2eJ+
	xG0K7eUE2A9Z9bNHSZMDaiFIIp6GlEyMOXjJIBwX5JcDLBttcmk59uRP4KWW/zttk8+znDjC9UW
	nDWpkXxfLulDVsQ3ql9+Lb8Aw/T48dJLoY9Io66rOEwX5FtBU4rGCzKCjynjKGs5w88b5yK0REG
	HXrGiaazDmtkfsh7q/D4xaF84CW+KMOENE7hmKbzUYLrkn3+e26ifw9Nl3+UathMUrainiNAbF5
	9gsmYEAdTd9gY/OntcMvWzILd5sOOwsLSMFBzXRnvcobHUyW8W8r0nK6Q7zy6FavXcIv6wUSFRm
	AUHTsqjtEfBeQuBsECiRUJ7XnA4J910Q+G
X-Received: by 2002:a05:6808:308c:b0:489:751e:9715 with SMTP id 5614622812f47-48f6210a6c1mr1543088b6e.26.1782220662352;
        Tue, 23 Jun 2026 06:17:42 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df823ab84esm125078946d6.37.2026.06.23.06.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:17:41 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:17:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <933c5d7a-e512-460a-992c-25be64ff48cf@rowland.harvard.edu>
References: <20260619095936.24080-1-nikhilsolanke5@gmail.com>
 <8175e40d-357a-4513-b827-752f679e9904@rowland.harvard.edu>
 <CAFgddhKKuGQgu0Ahu_WRyZocQGwPZkUejjoaJQ+P8--+k=Lwkg@mail.gmail.com>
 <8da4a00f-a01c-4b38-82a3-a718e5588f51@rowland.harvard.edu>
 <CAFgddhLVAp7nMX4YUHoaG+Q_Hm6w1uq9df2kH+4RWiJJGYDdhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhLVAp7nMX4YUHoaG+Q_Hm6w1uq9df2kH+4RWiJJGYDdhw@mail.gmail.com>

On Tue, Jun 23, 2026 at 01:01:12PM +0530, Nikhil Solanke wrote:
> I have a v2 patch ready with all the requested changes along with the
> documentation in Documentation/admin-guide/kernel-parameters.txt. Is
> there any other place where I have to write documentation?

No.

> Also, I would like to know the "low-level" type reason as to why do we
> have 2 separate buffers. a desc and then a bigbuffer? Why don't we
> just realloc the desc buffer? Does this have something to do with
> reallocs in general?

No particular reason.  I guess it just seemed more straightforward to 
allocate a second, larger buffer than to expand the first, smaller 
buffer.

> Also (a bit more tangent), can the usb device potentially fingerprint
> the host os? if we are asking for 9 bytes first and windows ask for
> 255, is it possible that some usb devices will fingerprint the OS
> based on this, and behave differently? are there any other such places
> where fingerprinting is possible? In those cases, is it theoretically
> possible that this patch might fix some weird devices that "seem to
> work" on windows but not on linux?

Of course it's possible.  Devices can do whatever they want, as long as 
they obey the requirements of the USB spec.

>  I might just add this one line to
> documentation that it might theoretically fix other usb devices as
> well instead of it just being a quirk to fix a game controller.

Isn't that true of any quirk?  As a theoretical possibility, I mean.

Alan Stern
