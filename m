Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE352E719B
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765947; cv=none; b=GZTkJGFNZk4igonvCwhL+b5WwNfi9LwUHfGZzTtn3eCWLp4g+ggdnasF10IwqQ5e2N0xoKXVs0c3SCxa6gDmwEamY/Sn8mpsmtbWGmV0VRd3+4Fl2yN8xCho2f/s36RmwJCwHuJwkV/1PNe6mPHg4DMaN9k6Z0UQ262o7FlZAoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765947; c=relaxed/simple;
	bh=CnnpEZx3VlsN9YJedVx9gqjNrzyMdpjXMrjCiXhvibk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV1SFds5yudV+hn1rJ1A1I797uyPQt8VEhf23yIfqrOv3Y2EQh90rl6X5vdjIMkwppN04G4gHbZpMI0uRvXTED5t9Kjp9HxMZPcxOpDL/dVQtNWo5S0nlKXVsJ0LlYKK5woamZ29JzPNJqxrFwUhlq8l+F0bB37R08kSW7bObxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IfRcJ/sY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IfRcJ/sY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52b6543169fso8885721cf.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785765944; x=1786370744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zifORfmFvZtG1ewOTJuIWyPwVRLO9geBY8xZM6iT7g=;
        b=IfRcJ/sYMave4Rmnc3wTd7rMgYp948witwgNe0RDEsaZ/pyyMXZTju3YKuq1T9+Q5P
         KKCF9ct9Kd1a6Y17T45F+7/qOHv0YEYqiYvhUSSpZqovro438VD383BoW2iCqn9rNawA
         eaG6RkXPHlp9MI7tqrRLi2BEypMzFDIN7N9C+Z+vQGV+Gi0cwtnxqlOjGv0qlbwtOowl
         9C5HDLtGY5xtKNYSdYtD0qcWhk4BjtyoCi+o2YJi7vTsYVi2Hzw8mYnJYSoJRoBIITFN
         idCo4l2GIv/x+DdRZPJhbRXgfXQ0yuz+0NS+JSOdnIatPcYrC/E4s43TjpObEG5po9l5
         r9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765944; x=1786370744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zifORfmFvZtG1ewOTJuIWyPwVRLO9geBY8xZM6iT7g=;
        b=FQZ7ee4RW+0cXLvQTgTJjyK2tWLguWVyoh7ePmUP7xCi5YBHAF2oE4rBROtoRp1g5E
         or98qQyaQg/vcTKKhZ+7E4FrF7YQinAJwJxdWwK69FFKSh6VdktDzW7yXRJsIa6nKHTv
         ITiard8S6yse9hu++Aug9kmx1adVbKCHC0NGqE3XBfhESe+oJVZt0o2ZYtQXje9b10Mv
         Bwb2PrkowApLmkbXZLn3dAp036UJuJwxlaTQVkDPiSU/+bRT86A7hxB304Fi72611+60
         Nog3elFbOwrRNbJcRl1r8pSH7/UMGWDAv+IJaK5S7/hdc/Nz2f5jpbJqgCCxRMfLpthA
         DvCw==
X-Forwarded-Encrypted: i=1; AHgh+RrjB3Cim3uuTWhXy68wJTaF6b1S6c32sfST7y6U0USvCYACPZuFAbEDirmu4U0+sQoCrpg2Kc25o0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHik4Z5nj20DxSFVW2bVXwMM+KEENoff3IWy5qOkq5i3c6+17g
	gfn7/THTfA5SpbuKIF526IVsPbPpd6QYcUer9Hbmf50dCX3LNyY9LdBvJrKY1nb9aw==
X-Gm-Gg: AR+sD130hMgzcd/RI4RR3W1rkmbcoP2oxub9sPFxUhnTJozUbn8CdDDdlCyJpKcdrga
	N6/9FSXq6TqyVZj7e8Lo2hoxw9EEyrqpx8JMnWIdo+fkIJPobfUIRi8nmLA72O74rHTAJEsjZ1E
	/F1Zbhl2cFa5QSMw0xqQK7ASPrunV86vrgkwbELj7B7w6XuiFPQqhRZZv0T4TQI/E2v1crYWdb5
	W2+JK9cUegRfj+RTs+OkjWIjJBu7IjGbBz+lSIEyCARgUFmrR+vjy1Yy9KYhmFr53r2x6WefMui
	9fGxlxPUqsCM017jmCR0Dijfs606aqQszkNgjkjT5dFthf0dVOOonGzTciu8GQc0fJxbPuLxkkZ
	9zNN6aONjxxEjuBBbhhKPvp0WuQdOV3sITABK4TtpJr+zeq4+VPGeZgIKVmzADXSt3/GQuQGkEp
	06QKLIVUq53HbA2hOIwR19+vNmm97UiO3ZOWiyrjekC69DAWs2O8gdnl4NU9A1gir4VgIZxZkv1
	Qi9NQU=
X-Received: by 2002:a05:622a:1247:b0:51c:1117:c6a with SMTP id d75a77b69052e-52b56670312mr226909831cf.4.1785765944381;
        Mon, 03 Aug 2026 07:05:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4e7ee1b7sm62187351cf.5.2026.08.03.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:05:43 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:05:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org,
	syzbot+6aa97991da41499aa852@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: fix device data management error in
 gadgetfs_bind()
Message-ID: <e8dbd94f-f858-48bc-958a-5ccde4b85cf6@rowland.harvard.edu>
References: <20260803091258.85969-1-dmantipov@yandex.ru>
 <2026080336-roast-sudden-e02e@gregkh>
 <ed1607b6-0ced-487a-a241-17f1efa27dfa@yandex.ru>
 <2026080307-glamour-reveal-a851@gregkh>
 <f18f3752-f5b2-4e38-934c-9f6afbc60575@yandex.ru>
 <2026080327-tightrope-relieve-0d40@gregkh>
 <2026080356-maternal-tapioca-3dc5@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026080356-maternal-tapioca-3dc5@gregkh>

On Mon, Aug 03, 2026 at 03:36:31PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 03, 2026 at 03:26:47PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Aug 03, 2026 at 04:13:05PM +0300, Dmitry Antipov wrote:
> > > On 8/3/26 3:25 PM, Greg Kroah-Hartman wrote:
> > > 
> > > > I'd like to drop all the "legacy" USB gadget code
> > > 
> > > Hm. Then I would like to ask you to mark this code with Obsolete:
> > > in MAINTAINERS and wait for some grace period at least.
> > 
> > Grace periods never work, I'll just go make a patch to delete them all
> > now and see who says anything :)
> > 
> 
> Ok, it looks like people do use the raw_gadget driver for testing, so
> I'll see about leaving that for now, let's see how much we can trim-down
> before getting there...

It's worth pointing out that a bunch of the "legacy" gadget drivers are 
nothing more than pre-packaged, easy-to-use versions of various 
non-legacy function drivers.

Also, the zero.c legacy driver is not meant for normal use; its purpose 
is to assist in testing UDC and host controller drivers.

Alan Stern
