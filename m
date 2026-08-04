Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50A44322F2;
	Tue,  4 Aug 2026 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831719; cv=none; b=LlyvNzAhw0FKAntzae8SZO2vvBTSQPbBud7m0Fw41UD0ULlINiUgdgl9mYY/NnphoR1KdHgC8aEM6/VZotDPKzoePY8AaVTxIi3+jwAW2JQcdbpLc3XXw2vcdoVlJndZoc7FtyrYF8aK5bEGnkN0hVqPtGm7LI5q3rnaFzhp8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831719; c=relaxed/simple;
	bh=VVEfFH7Hpr+bMwxz7M3O148IiZ5ECKBCfUxtMYaZ82k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orJrf4EMZpzr4ShiEhdndCJq3eMt/fRZVnyMsSiMhJjFrc1v1pIdt3cJzGkrWw0vFdVmGn8JCRkeNEscU2j6Bx+sdoNVVO9CtTJiMr8r+tKdB3zMCU8UwWMVHN3aJnDMZ0CFkAJ4YsOVWsB23yDQJt+NjO7bEtkd9tga6jRDH2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M0X1b/U5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M0X1b/U5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2711F000E9;
	Tue,  4 Aug 2026 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785831717;
	bh=wp6pCxdqP4AZjXdkqP8zBbfgwoSbFj503Zw6WpqrTOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M0X1b/U5b/dAtNVBhMkwoP06vDVjija/K74J3Pi3PFSs6gcSzWZ30CyY5IPhq7v7G
	 /mi3+96WIxUzCIq2JH8NbG1aY/8b3SjthIlY+iwpn0Lv56LhBwEfcEFgcciVXCyq9V
	 atE374eCwgFZas+dTUWdKI0KiaJewtHnXj5BOJq8=
Date: Tue, 4 Aug 2026 10:21:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: f_phonet: fix use-after-free in pn_bind
Message-ID: <2026080445-dyslexia-shell-2db3@gregkh>
References: <2026080431-paragraph-caloric-0aae@gregkh>
 <20260804074432.2906951-1-khiemtranzo532001@gmail.com>
 <2026080420-grudge-version-8bf2@gregkh>
 <20260804081853.2921752-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804081853.2921752-1-khiemtranzo532001@gmail.com>

On Tue, Aug 04, 2026 at 04:18:53PM +0800, Nguyen Quang Le Kien wrote:
> On Tue, Aug 04, 2026 at 09:52:53AM +0200, Greg KH wrote:
> > Did this new version properly run through syzbot and it reported it succeeded?
> >
> > This isn't needed as you added it to the .h file, right?
> >
> > And you didn't answer my question about LLM use.
> 
> Not yet - I sent v2 about 30 minutes ago and syzbot hasn't picked it up.
> I'll wait for the test result before sending v3.

Please always do that before asking a human to review it.

> You're right about the redundant include; that will be gone in v3.
> 
> On the LLM question: I used it as a drafting assistant for the v1
> changelog and comment wording, but the race analysis and the actual fix
> are my own, and I build-tested the patch. The over-formulaic changelog
> and leaving the old stale "no race" comment in v1 were on me. I wrote v2
> and the upcoming v3 directly. Will send v3 once syzbot reports back.

Please always document your LLM usage, as our rules require you to.

thanks,

greg k-h
