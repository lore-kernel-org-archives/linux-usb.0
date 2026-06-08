Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA0037FF68
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926224; cv=none; b=lT+5Fo7ff3KJK+7jnWwv75sbGBQUmv7djCPCxjjMZr+KNfnGITarxCsBoR7iA982YkH89Kc3sOA4Ky7XuVKrqHaxA+yV8DQMF8qMYkq7LpziWyoNNUVpbAkEFaUHo5wBLYXdQN9Kg80tagkgNJG9n/PG8ZM3iZBENqa29Rek70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926224; c=relaxed/simple;
	bh=zQ9ehB0IcU9pd6GgezcxtqJwKrDVIZ1BqiyaU9+i4C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeQlRj1d8RDm8HVfSpXLA6OKMzPvomRpUXP8K7LzdSAIWTuCJZrHP+9BGZazpn6TsfYOM1ElUwIdg0hZfwLmyR/3YhuGADEt4Rf9/yvFa0MNlfDxnbdbxdK8xLcJY4o4c3J4y+tL4xe2sLFmVn/fW6cAjJuML9wYReoIhibIzKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cnAVQPFr; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cnAVQPFr"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9158fbaa4bbso486034785a.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780926222; x=1781531022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnqpYyIkzvNf5gOociJEN2ud/Mqen0Pyj74BcX+Tf4M=;
        b=cnAVQPFrVHjD7N64Sz8mowOcxr/Hg3QXKIsqY/RcD90uUyMvk0M1i5BJaAJ+7AUxRm
         OtTAIJl6svNg2V/Cfyg5x3IFlkiT9KhqkN2fy/psBwvRylBpePTYDxAyoYCiNgaY23vl
         U14PoAQeRHcWnLgOFZvm2UJbJnBUNo8B2LFYwy451h+zvLkk1U6XqdUp+0kk69r1I+ry
         PTes5ItG0KumsCxgZIEDsKTfYv7QBNrQKkQm2RA4mlNUjVxAQiu2/CXJs+0uCoxPBNYA
         nHjsQigJuKHHYh3xGrJ9B+WAgsAPK3Xf7uiRlL1/XGJV86WGKmsjFc+iCcXFQ7pr+o20
         78iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926222; x=1781531022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnqpYyIkzvNf5gOociJEN2ud/Mqen0Pyj74BcX+Tf4M=;
        b=relXpmdGERYzOb0SX+b7apco5Dy9TKV3ubGWSdUG+NkKXGKCtXhrGDf4EW2XG/uhLh
         2vpUSlPF6iFEcr8C3BfG5CKG9kXEbfKdwJv0e4VuB2NvP4BSeCkmjfAvIcpDF4Gfr4D5
         rzluPYtsjsXrf3wIc7/ObD7iKt7hhHbph5pEk2Tjo1/cMD0GFRv4HNNe/a720/LoVBPC
         UdDJQ+bZkXwJmir6ED+q5H2ft7xwO9WClUayCIFudf97jSWeL4G6Hvkg3Re7KkasqCJB
         wOJcMaDA0qjKqitM/0jSXdERdn9uiiX+iFdIIWG8dtwcmP05lkrJkG1+ppIlMHDesEgZ
         g+Lg==
X-Forwarded-Encrypted: i=1; AFNElJ84hYwpVOmPwSj6g7gpmjXxxW8LtMCuYouxtoyS90rTQecDm92GZKDjv4D3jw8Z9PPda5LHu5I/T+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr640u8HmXUA+k6UxhvqkBjzVMQ6aC+K3qNE5AAv+LFh5FLpPc
	7BR+fLy91WAcqyPGBq9goT+ix15pZzgtwXt7BUWJskdmI4dKByfibR74TyQC5mTYMjDCpkWps40
	VdT0=
X-Gm-Gg: Acq92OEl1TrXdsrqlRUJVSb8Nx5EqMRkrnPTgi2KJplVdGDHExUcsmjlwqbDpJSa7fK
	P38OEp0Vw4z8KyndSL+YoM94YS0wkxRUP8L5FY0PjXDlxE6PD7b3FR11nvLoBXFnT9l2W/K+er+
	ELjOJE/wHET8mmzLlOcv/Nr3bAOQt1lZBVXk+fpRFk8Yam4iHwVTEQljgjNiw73qnS5qWwh0Ik8
	WrDYkwdAgWGycTqg7L27GNNfh4fAZ2DA33RzPPQRFT2Wmbd9UVAmPOKh5ZtxNJWnzSM5oFk3dgu
	pArXRcP2RHncMI2WRVAZqzSm2dGXX7dF7ohHGVqTHR67JXDaPEFSb6ljvQSdV4+PD9xKcO45arI
	DQSJJbeCq7cxbpGYQOXFRE0BYEL2T6i/5fNtF2B/AaPGy5iSmHfr+1VKYyshrLVWAvv1vHUof0C
	YVnyZIw0jkextkCwKrwFu7uvlkNS22mDeoRr5K38Er7cxZP5uzo0uEtQ==
X-Received: by 2002:a05:620a:1b8d:b0:914:c0ab:f1ee with SMTP id af79cd13be357-915a9d93f2fmr2453754385a.44.1780926221980;
        Mon, 08 Jun 2026 06:43:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm167487216d6.14.2026.06.08.06.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:43:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:43:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, katieeliu@tencent.com,
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <9b2f58e6-b55e-415c-b2de-93d9a52b9b65@rowland.harvard.edu>
References: <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com>
 <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com>
 <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com>
 <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
 <20260607232535.74b935a2.michal.pecio@gmail.com>
 <80bad7e6-239e-4b7c-a175-0ba170b7c883@rowland.harvard.edu>
 <20260608091735.3a325cc7.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608091735.3a325cc7.michal.pecio@gmail.com>

On Mon, Jun 08, 2026 at 09:17:35AM +0200, Michal Pecio wrote:
> Currently I get a usb_choose_configuration() crash after moving the
> usb_enumerate_device() call from usb_new_device() to hub_port_init()
> to reorder it against BOS. Will need to investigate later.

Probably the best way to do this is to move the usb_get_bos_descriptor() 
call and the following LPM stuff to an appropriate place inside 
usb_enumerate_device().

That will interact with the descriptors_changed() call in 
usb_reset_and_verify_device(), though.  You'd have to read the BOS 
descriptor in that routine and move the comparison against the old one 
down below the check of the config descriptors.

Alan Stern
