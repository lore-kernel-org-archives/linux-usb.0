Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D824E3F0749
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672427; cv=none; b=Qnyx7uiOkMW3bv+sSJcqmHmbdDbZhkCiDI0AQhlnWf+m0z63hgAmreAVefXBxeDOqvZ3jc4RAlTX8mh6M/pPawv2C0yduqGUKUqYN4kBasmF8nDU3h4p8atzAzX+1AAVbgTe2exU+rje3xIX7nj7z6jwoprZBeJklVJzLT2Wlvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672427; c=relaxed/simple;
	bh=oKnmmfSnKENC1pGST488qKeWHu84ymkuy5ddsymmdmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ/HXEwWWGV7UyVULKEZkTKBdi3H31LlE1e2cioOLrilhqllWRPzXmr8ZyYyieVklR9XgxDPpewAVF9j0hlT7Qq9aySyriJEX79E4e0KmOeeZ/vWD9tYg34u/XxPPZJPjz16GYpo2f/OffRzmgg4fBxye9aVCzCFEX+cgwGqwws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RT0+stcl; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RT0+stcl"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so36880376d6.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 08:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787672425; x=1788277225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6C8GAW/W3Y755pjJOjVw1oaoPt23Wt5Y/hdfEapPovQ=;
        b=RT0+stcly+Wwz5wDVd14J1SNB+5KlluFDKXb5cNZM4TSMGVdMzyNwSrYzfedW+P7XO
         0KSvunCBjGRkI5O8tp5qbbPM+nSukhq3O4hPieC0iTzPbz0XJyquCCEvZsU9pQqJXWpc
         G0LfSzxXkbGtZarzP+JPY/cJXkJ/qUP7BeOIhUPuOmLVrqqSUp1ugEqef7izGeHOV9QW
         T6+SzZKU6MxbFzjBvq3RtmhStU1ucOrNQjP8qSBbcuBRTaJPGgjqT38HEJMyd+nq9Vfi
         oFTaEv3X+ulLfrlPRGOoJ6+idVr95Z4txCtuhJe2TwDEXToIK5aVXo9RrY1fmB8jr5Tb
         LbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672425; x=1788277225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6C8GAW/W3Y755pjJOjVw1oaoPt23Wt5Y/hdfEapPovQ=;
        b=gaS16dkLJH3hwSePpk1ywliyW5rV6uVi0r7Z5dkcwQ6Vrr38AATKO5vgRJ6Ieob1kn
         9P5yBi6ZqAfeUeXyNvbehVjqFOwJa7AoUx00+pueAdaoE9Bpsi6CsRNQP0Nb67tgmScF
         ZMw8MFkDbeAtfwOhIsnG4/Ftyg/c1P10m26iHRX4MBxiFMZoi4NzPPW/PWn+IEd6z9/n
         aiYGOOdGITqsaQSpv+dO8oCo4bRc9VaG6AzhZzKVqKtbh+JnzsUGtx5vyFa+66I3Xwxx
         9mwQl8ydA47wGMt3qdVzodsilzpk8FsLfc/xZm4T9Z6b7Fe2grqcvNFsdeWPhnJ78fXo
         xQtA==
X-Forwarded-Encrypted: i=1; AHgh+RoQj/It7RYrOEa0G45sh34HrFSZAy6SN8rmmg/KDDh58PWZcMkAQ0xUbyrcQkPB37Et4tZoG1hNWHc=@vger.kernel.org
X-Gm-Message-State: AFuF++lUm9fRGeJ+umU9PJl2OioihOJ6OIShljJNwNYk99heVF1JdzHi
	dhR7USqYbNepblPkdFdpYaXIHFrSbEsJ5tEBXr2mMK5Q5hSEyOobFDL9yCBg31KW6w==
X-Gm-Gg: AR+sD11zXIiWk7XX5w1bGQMfUUqcA3/DIUaYgqt5g4zS7Sm6VpVfxJVvkeIX3vVGF4P
	b9wRMPf+ShcNlFy1S+6MckVndOLs3D35OQmvDxA2pXh3UYjRm/h8Pxp3WxAwONbgkXcqhcoSpTx
	UMERJX7n/kBCKYIM+vWCXSLhX+BaooH4r3yomZFPSGUxuWE6/rcpuK1Ba7i8tgL/EUGFNQTa4QP
	UjJ82g4iM2IOLOyWNyhNabmlO0xAumIzWa3BHB+hJ0qTgfR97BQ5lFyYE6tSJXEAQHEx9Dlu7+U
	lHaU66E2YrdbB4Wx8CjZOcOXVeOmBSRX7Pmar37E/XvJuS/Gqfywg4r7M56qlSd86/zwIBKaDjY
	lih7EjRCdyDF43HuYZBiK5IM8mTVjKdrSt6CnOzjAp5oZWdQ1D/lGg8noIimY+RZ1moDCUQOTPA
	a5402y2pk5wC/amc/dERcm6CTYgrudjclW2iixydbQepPVIecA1j5xpOnHa8z+C0bLwM0T82USy
	5dTmg==
X-Received: by 2002:ad4:5d47:0:b0:907:5cea:2f00 with SMTP id 6a1803df08f44-90cb77d1d1dmr75837926d6.5.1787672424744;
        Tue, 25 Aug 2026 08:40:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc62282casm2177246d6.0.2026.08.25.08.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:40:24 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:40:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jjy600901@snu.ac.kr, brauner@kernel.org, eulgyukim@snu.ac.kr,
	gregkh@linuxfoundation.org, jack@suse.cz, kees@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mjguzik@gmail.com, viro@zeniv.linux.org.uk, stable@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: fix NULL pointer dereference in
 gadget_dev_ioctl()
Message-ID: <13476f66-13e2-4625-9169-61af0596f6e0@rowland.harvard.edu>
References: <20260824113510.1141236-1-jjy600901@snu.ac.kr>
 <20260825105801.319997-1-lovekeshsolanki00@gmail.com>
 <903f6c28-57f1-4aa2-a111-910fcfbee52b@rowland.harvard.edu>
 <ao2mZdrHdkRTypkU@eggarch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao2mZdrHdkRTypkU@eggarch>

On Tue, Aug 25, 2026 at 07:59:43PM +0530, Lovekesh Solanki wrote:
> Thanks for the review,
> 
> On Tue, Aug 25, 2026 at 09:14:37AM -0400, Alan Stern wrote:
> > Why does it matter that you read dev->gadget before the state check 
> > rather than after?  If it doesn't matter, there's no reason to mention 
> > it in the patch description.
> The order of reading it doesn't matter. The important part is to read it
> while holding the lock, perhaps the wording is unclear, I'll reword it
> in v2.
> 
> > Also, why does it matter that gadgetfs_bind() writes dev->gadget without 
> > holding the lock?  Again, the description shouldn't mention things that 
> > don't matter.
> Because ioctl can get a stale dev->gadget before dev->lock, while
> dev->state is checked after acquiring the lock, which is the cause.

But those facts would remain true even if gadgetfs_bind() were to write 
dev->gadget while holding the lock, wouldn't they?  So the fact that the 
lock isn't held during the write makes no difference to your patch.

> Is the reference to gadgetfs_bind() unncessary? Or this part of the
> explanation is irrelvant?

Yes, it is irrelevant, for the reason just explained.

Alan Stern

> > Why did you add this test for gadget being non-NULL?  Is there any way 
> > it could possibly be NULL at this point?
> It seems it doesn't matter since if read is correct it can't be NULL, it
> was an initial attempt to fix but its unnecessary now, I'll remove that
> as well.
> 
> Regards,
> Lovekesh
