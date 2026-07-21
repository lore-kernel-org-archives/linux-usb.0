Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE7A3FF1D5
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 01:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784599063; cv=none; b=qivG5hiuc+h0BseQk6omX2rkBIrYlAvhrcUDCqNRx5kJ5STGYzl4zZLLd428cm2jri+PVh+14RzMNyQ51jg2ju3VyMN8rMgxyrI8DKJwrcciSkd7yB8Ane6WlTl4vhKSAAHLR2KOUAgAWv9Mmp6EvMx8aZlAEsByrsWXW9PvCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784599063; c=relaxed/simple;
	bh=wLZIHKoJaGne8w5qE0ZYX3giOqBg5BJB7zPbDPZ1kk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeM43zsySzJuJYtWoIFStQwsSDk5vIuAIh+eRT29NYCM5cXkbSkIM/8Qxlg/X/HRyuunR3HybLVhXAdE9JdMHOAtd335UN2ZNdHF7pCwVbdrUu9zVd7F4G+0VE6bv90ZPNEwlh4Vp/GnTThR0nGsHpoSfnzUYTjPVNYXzPNt214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BYFj8OoC; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BYFj8OoC"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e5d50b0dbso556529185a.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 18:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784599060; x=1785203860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGDbq9Wd4hu6XfZYfztN35nbu6mnVSI9hIQmyDGnV4c=;
        b=BYFj8OoCX9Cqd+9QBKp9cPsZ+m9iRL6ixuVN5gI/f07teyAn+n8nKQSSz6/LdYpeOO
         PDMHSKfNdrPPNC+Nbj4ivj4L4MT5vcyZSIkhQkz7h8J1fMq9wGf/F6kxvES2WRCJufNp
         ruh6yi2+3mjBEr0/iDlnxX6b18d40e2AFEeNZoM3g1UVnDFra5fKPq4RxjTqDJ2wo5iT
         betEl2b/rzCwT/LyGJrxm3zI1W3+uEG4hHp9EWfigLYzjB8V9oCCqiUjVlFXRqV6GH6y
         C/gWKnsv7qs1LxExo4Cqbd0CfXgncYE+UKHph4DiScHVIcGlOQKykYGD5TpZbDC+4wfM
         1cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784599060; x=1785203860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGDbq9Wd4hu6XfZYfztN35nbu6mnVSI9hIQmyDGnV4c=;
        b=azI53nGI63gDu6SForPlMivcY6FmleLH/WXLqq+LobRFxIVb7JqXDoEE7LHIBvzlI7
         N8zUXFMg3vtKI5o0IR/TJRDwLBmFEAxdpXXtAPZP9rFdUv+fVot9Ay5P9+EAjagl47RL
         qtGHGrETXP7CEEWSxDb8pIUlsfyg9l8kv0umDk78/cmX3c7Br00SH8kLKOyPcmOx0DJJ
         fYbJCcyUy9mAC2n1A2Rp3HyyaoonAvCvx7Zr1DHajo7y6d7dnEhoghYSWvnR6BTwmLnK
         wRyYWx81zJe3Xn2cRcb+uq5nA6Q/iePEiwgqC31XCzDfFeTSaTO2/MGwg5gf2MF5Hy+7
         jK4w==
X-Gm-Message-State: AOJu0YzNTS7Cg0uUrVr5tmSQ+yqTtt681FaRqgwoikIvbzV6oRg1IPIX
	T6oeHSR/STOmM/rM8K4emWyk6YZp5IYHtuD0F2KrsT3iFbWWzTZRcetI+NZ/wH7UFhbN0Vd6usG
	y8MqEAw==
X-Gm-Gg: AfdE7cndaK/TDH4vRV7PHscFksrb/kOuT1WEdAJTJLI8Z4zCqJnotpNZ3JJiIaFNINm
	v8nvfdJONvKBK63yLeAQSuCLWzf/K22GkxYY1w6XHxnbWoQ+Qd6Ne1fLOJ4rekFf+efjTn79AsY
	ez2PX5t1jvZ/OQhcDaRRxYhhZNtYL2TuQzU/ZY0CGQ8rdV867p+zzae6aRTocsK98vovPLXwxwx
	wjkajvniupFhDCl+3/MrKMI4rZVMmd3lklbN72ImnBMD0wyp97MVjBUG2vG0YF3CjWeQf7jAJj/
	NUym1ogTi/ktvm+E+UpZR6R42ZHeighDLQ/mLsdmwFgZ/KzETD7OuG5D3fEbhxenXEOMPCGG8Bz
	PM8lLR4SZJ5gcinLiD09Zq4L3+hWwQp4cljdl2gXIsqgnW18cUfIxUnLIxR6nleAgWLAnrQqSQI
	2JIr4=
X-Received: by 2002:a05:620a:2787:b0:92e:5cfd:154e with SMTP id af79cd13be357-930b3e6f684mr1652728885a.14.1784599060103;
        Mon, 20 Jul 2026 18:57:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52fc745sm1015193485a.14.2026.07.20.18.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:57:39 -0700 (PDT)
Date: Mon, 20 Jul 2026 21:57:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Anon <myaltforstuff1234@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] usbcore: EPROTO on first-stage Config Descriptor read
 (ShanWan clone, 2563:028e)
Message-ID: <bc2e0cfb-98ab-45de-a85d-e380d9db3629@rowland.harvard.edu>
References: <CAJ5U=Uw2R7xVEY3ugZ_gRsi+yC9WviMbFEO9RbR6A3ue-G=adg@mail.gmail.com>
 <34fd1f17-6e84-4d5c-bbc0-e1cb990d2017@rowland.harvard.edu>
 <CAJ5U=Uwnt0kSJ+rFiA0tDg0=VZo3sVjfs49nHoFKXp28JTNoxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ5U=Uwnt0kSJ+rFiA0tDg0=VZo3sVjfs49nHoFKXp28JTNoxg@mail.gmail.com>

On Tue, Jul 21, 2026 at 03:50:37AM +0300, Anon wrote:
> Wow what are the odds a patch this recent landed for this exact
> problem. Thank you! Realistically when will this patch land in
> mainline?

I don't know; it's up to Greg KH.  However, he's probably waiting to see 
what the response will be from patch reviews, in case any changes end up 
being needed.  You can speed the process along by reviewing and testing 
the patch yourself, and posting your comments on the mailing list.

One change that would be immediately useful would be to add quirk 
entries for the various devices that people (I think there's been one 
other besides you and the patch author) have said require it.  Maybe 
that should go in a separate patch, however.

Alan Stern
