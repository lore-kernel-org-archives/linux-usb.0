Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E7F1F16B
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067442; cv=none; b=iMGelNrAkSIceDoiv/4RhRzfDkjFCs+4QUHy6XalLBTY/KX2PPMeoswCG2ZhWxBe3i2ZwRQMpAas14Pbuu5vuKSj0f50hGe3PTYbn41mTrvHQWY5d41RCMJI913RoNq6cqxOW75s03vruBd4TelffjLMSQW8B6eu+2ip0x8BRxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067442; c=relaxed/simple;
	bh=aZqZYi18fHUjbAUY/ZshE0O4WseDB0xSTbF69cVs//I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEEdUHdyj1QBcp7jweP1biPs5IUow0sGS3CUfoN308UCMarauqjxgW8FMq/2AWV5xTn3v82EzExjRig7XE8fuTVvudN9XKCcmmhkW2qgQ0Y374OOBQqi1VQJX/1J4qoNS+aSj1g0Q5K1cokNYU1ns8M1oUn5py/FEV5iZ+nNYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AMQmWGyx; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AMQmWGyx"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c2a76536bso44632811cf.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787067440; x=1787672240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLqAQEw3rXL8/MZPDsV2OgUVMCATzjFwzJYqncXsPSY=;
        b=AMQmWGyx347uGH0U47KSiGXYsKMPw1r/0VxBo798W6+wjZHoeQWaE4v3/R55bmaVyq
         TpEW6G0xzdiL4YP/Y+EIvPalQGVmN2hCNhPI3zLPyatdqhPiehBtugCNK2j7cytHVJEl
         ErrsSqBvC8RPq4Jo2z0uhEnprP6WXz+rkV4/pPWU034JPKOoYMnZidZwI/5EmOwF2xVk
         6u4Io8BtGgUxWDnrf+NFHpwE7nlE/D80T8uH/vHhi/CYu5mnbFgE+Pau/YZQMlS6e7y4
         9j0pZCt7r5aV/LwXrEt3THRmSTxWHdG86PLZ2QHafJibKo+oZw+yH8Kb+B44vbyhGrBM
         iI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067440; x=1787672240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLqAQEw3rXL8/MZPDsV2OgUVMCATzjFwzJYqncXsPSY=;
        b=Ye3pNNlZ2JxMh1a75yeDOXivG0YlY8v4WgeguXoHwG9pi34Lac82XdauNIP0g++Rmp
         N4uhOoPT+7gLsro0u9Z92gHtCzOKU7bXv26VuV7dCOqiq9UDlLLihnhJjrsEzfRhWTQ3
         RuP851rTvdhqpoRYl7y4rwn2PVBlFS2W21Pt5QG+Ub9y8IA2SLCnk0pnHRUcS/9x20aw
         0+jrarwhssBs/s10WvAxDi0DGTqLG0RmLlQU71IFVpM0dIS6r/bWd9QqBEd+hxW4I+hA
         5rdhg2JDeoX0/3HJk6L91qK+nMvQJKlaMXs4aNGuo1svvGTtVLMuX2iy1cGRatrH1niH
         jJcw==
X-Forwarded-Encrypted: i=1; AHgh+RobY2OcI1Jvyr6JFoaMLg+JBRjF2q9TrqNtNsJ5RX1rkUmTZYuLfaqxrxJrpVPlrH8llrSWep+2gqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQYPqvB0oNC1/hfFS3VQs5tGEv5Xiwp6iFw+Ki1vg9QlWIokJ
	cPXEcNPwzR4zxZ4sHoErzzdFbnkhlS+CSIlyfFjQ6J8+H5kV71oI+oi46P+yLPbC+w==
X-Gm-Gg: AR+sD11A8SoIx7je0Lby6agt0gIlESsMVuy43McWm+WPjYlC+a/BI0viwimBu10Bne5
	LSCMu4S4CLFGZe9EeuiHHmNPZjeWIQn8j2Sj8Vhc4QjYxtdcJh8bmlZGqt+i1kkcyZa9ToQVIYn
	3pF3lcdpAeTDS4jtZu6CTTLjH6UjxWtbkS2z38Qv7Hmipzhx6+sWdIUgHxFZZju7ESsZmFS9/Gc
	r7SgC36khSSNpz/o6kbQvas8Zvt7DVzGpi35C7Oq2NY73LvFVVbfM8U4KDt5B3w3NAf6fIkMRtb
	peticoVwcqiVdzc+wDa/0uVFGdDURWgWBVLgu7WAb8oP6QHQNes2+vmqspLqqkwUxt6qVepfjwE
	U5cX0I0YLP9GfcKJToZmLJy+w5gEiGCvuhcZCCMMpalcogp4xeI69534posPsG2H9tYFXqPtCI0
	N3h7Ex+dXlCcIXwJJQkPv8312Hu4HOHALYgLmArL/V+F4PMsLCAy5ZcJH6aL+5xVg=
X-Received: by 2002:ac8:5911:0:b0:52d:354c:5b91 with SMTP id d75a77b69052e-52d853e367dmr373102671cf.16.1787067440100;
        Tue, 18 Aug 2026 08:37:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db62175b1sm44141481cf.19.2026.08.18.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:37:19 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:37:16 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com>,
	asml.silence@gmail.com, axboe@kernel.dk, brauner@kernel.org,
	io-uring@vger.kernel.org, jack@suse.cz, kartikey406@gmail.com,
	kees@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, mjguzik@gmail.com, nogikh@google.com,
	syzbot@kernel.org, syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	syzkaller-upstream-moderation@googlegroups.com,
	torvalds@ppc970.osdl.org, viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ep_open
Message-ID: <6232f9c1-8b07-42b9-8660-ad514702ae1c@rowland.harvard.edu>
References: <34e65096-8827-470c-9a88-8c643cccef22@rowland.harvard.edu>
 <6a8338ea.dbb3a75c.20434b.006a.GAE@google.com>
 <16741050-a3e2-4193-bfca-232a615a1311@rowland.harvard.edu>
 <2026081849-flatbed-unashamed-a52d@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026081849-flatbed-unashamed-a52d@gregkh>

On Tue, Aug 18, 2026 at 09:42:34AM +0200, Greg KH wrote:
> On Mon, Aug 17, 2026 at 02:14:17PM -0400, Alan Stern wrote:
> > Greg:
> > 
> > Has this patch ever been queued?
> > 
> > https://lore.kernel.org/linux-usb/ee41fbfd-f368-4a06-95d6-ae9b4267fd82@mail.kernel.org/
> 
> No because it looks like there are competing patches here as you point
> out.
> 
> > Looks like you can add syzbot's Tested-by: tag, as well as my Acked-by:.
> > 
> > Note that a different patch to fix the same problem was submitted here:
> > 
> > https://lore.kernel.org/linux-usb/20260731230603.4637-1-kartikey406@gmail.com/
> > 
> > IMO the first patch above is superior.
> 
> So Aleksandr's patch should be applied and not Deepanshu's?

That's my recommendation.  You can take a quick look at the two patches 
and see what you think.

We haven't heard back from Deepanshu.  Aleksandr doesn't seem to have 
strong feelings either way.

Alan Stern
