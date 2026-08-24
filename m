Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C40F25A640
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787531393; cv=none; b=qiHlWchMGtiYNvSAjYFy+gu3iWL6f3E15HTc0qk0lAzfNmpkJPS+NrnUxKS8bwJ3lXT70uMirNLeeyStYEwrGsLgcFDry4oX/k45gnqEb9lEak/d4yE+0RmZp/Ns5ZZYtzP2tJrjdPxtjiAaakGAcnKsS278uANRzrJrSKVwZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787531393; c=relaxed/simple;
	bh=S2VVXIm9NXC1/7S/os++vXO4y8V6rLx/oQUPCR5sBQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1ZaDBIPI36DXGLP472TtVa6Tu1ERD/nPVk2qKWgVHASwPm4yO6fGXzJZ02SNW1AStnXOlwyfpeHSr6eXU3EbeyFKdkSYFhWu/U77472aVYnmYinbSKdpEv+XGSmhXNkVRZ9ar7JHy1hPC7hyv5fd6wNJlVpyY1vE/pAdYmwZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tFfgQyKk; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tFfgQyKk"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-527e352a167so18079381cf.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787531389; x=1788136189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0oyaTfgHNj82lNrvA/IiuK50TaUKsX5aQhkbMM0CdQ=;
        b=tFfgQyKkG21HQZUundOLVyqOin2qKQ0MJFBydV2CDA5QHCmIlcsjIhV/BfJWaqQxHo
         c8CaVoSwIMkY7EElZQ4zoKc/jfPoG1EhUYofuBoJAS2p88D+mWVuBTc4NlB3WknYMQnG
         6CVEYBIBs2UfV2ck/b46KWUOw0hYGaqcJkZFNLlDGKQszYWc9j7jNzTcAFDww538Ptx0
         Perjv2XhvK1hAxxbwy+PYBpa+qAu8fayVv9ruZPYg8Rt/+yBmpm17opEXVyL/0nvyq5I
         hwx04qBMuiZAVeKC/8+uYHRvN5G7wgC5qEnKx8gALxBuByLdkwc+Rm3oFTsfHGdUBM12
         VdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787531389; x=1788136189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0oyaTfgHNj82lNrvA/IiuK50TaUKsX5aQhkbMM0CdQ=;
        b=SslOcHLq+i6eB4Mb5uJ0V1iqNXydudxY93qlhy95w8cstm4wNHjdsMy++B1AL4mLuK
         PoIAb9l11yGfO8LAit/Boz4BC+3zC+Ke5LzKmYmx+ZPuVgJo8tmD3kvD9WCy0voGmOP+
         GL6FnUO+JOqYKf2BRgLsqz6M0HjY0qjWmFAMLUtwSQMVt4Vd72Fe6wj41mMAPO72GtZA
         dkL9Sx0ch5aBwO0C0Flf147eM5gHez7uguRsT8cLLPubKvCSvem0QNC88kcO5WD0muVB
         0dY8pOZUSUd+TQ+7AziXNaLuX/sPL9JCdXlZnmE6KjWcoWORwGa7pyyZ4PeMd1y/2iS4
         LC3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8VffcZ6E9Dw4p4+yFoJEs2++Ic1cVYOzU0UaiXuVr5Da+zQ6V3A6GzfVSLY0l8pN4DZJUoovVnNo=@vger.kernel.org
X-Gm-Message-State: AFuF++nxXfO1/YB8z4DbhBGOgm4dsnF4R2dNFSNSouVKaibxT9+L990k
	KkboAO24l2lsy7r+yDp8xw4hTefF7x0h2saCu6QgpDox+Sb+VQc82Vg+Al8A6yET33dbdKhoMuu
	4uBSsrg==
X-Gm-Gg: AR+sD12UZlMfz36TltCuxeE8oXj+OG13EhMyFhH1MrbM8KVmyS9xrTnnIMURa+oDPUj
	5bZPt2HQ7PcnhVxtHm1WOq3ulB0gYvpoXXy4dEim+ggNQEGqsX2N3opi04QFsOIOZxvgoAzhQTz
	iXoMZx7j5YumlR/dS4Bbi8qap0w/4oL41IYQnfGDhIY8LblZ4qyNnQ574c3/a7kgvPI/X2//0h9
	NIRjtyG+ct+u7ZiUfBblzUhsXqn1XCe/a8BzaYvkW01VZMBXfl/w/Z6r+IT6WPWQW1tjO8F3KWt
	laJ/YmD9TPeoheoD8vZvhZ8FzMhRDo4n4tNR5Pd3sZrNP0pUQ3sv4tXebxUvhTlqWRcHMcMp848
	do6l7LfbxRjXwnN69Yw29oAzJUmOhFZxipitG0cQ3e9t5JnTL4vLlgpGracjmf4F6DpVAxyqqwO
	aIkvT2qL6nvdx8FreDhXY9h5+g5lZnM9RuJutD2WlAlxU6tz9X3DmZWlpkW80idzU6KCa5nejl
X-Received: by 2002:a05:622a:4083:b0:52b:6543:d8b with SMTP id d75a77b69052e-52df573954amr253830641cf.12.1787531388897;
        Sun, 23 Aug 2026 17:29:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09ae7211sm36723671cf.26.2026.08.23.17.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 17:29:47 -0700 (PDT)
Date: Sun, 23 Aug 2026 20:29:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <190b86c3-5332-4d77-920c-a845f8a01b2c@rowland.harvard.edu>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
 <2026082307-negligent-lusty-750a@gregkh>
 <2ce6496d-6166-4470-b424-2b187908f2ba@rowland.harvard.edu>
 <2026082333-persuader-overturn-8205@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082333-persuader-overturn-8205@gregkh>

On Sun, Aug 23, 2026 at 07:28:10PM +0200, Greg KH wrote:
> On Sun, Aug 23, 2026 at 10:40:03AM -0400, Alan Stern wrote:
> > On Sun, Aug 23, 2026 at 01:46:43PM +0200, Greg KH wrote:
> > > Ok, I'm going to add a new TAINT flag for when unbind is written to as
> > > that is obviously not a normal operation and is only for debugging
> > > things by kernel developers.  Adding loads of work-arounds in the kernel
> > > for this not-real-workload-path is just not required.
> > > 
> > > If syzbot could stop hitting this path, that would be great, as it's a
> > > root-only thing for debugging and not something "real".
> > 
> > Actually, I could imagine people wanting to use unbind for a real 
> > purpose -- you could consider it to be a more specific form of modprobe 
> > blacklisting.
> 
> If you want to do that, just don't load the module :)

No, because unbinding is more precise.  You can unbind a driver from one 
particular device.  Not loading the module affects all the devices the 
driver might bind to.

> > The bind attribute is the one which really should taint the kernel, 
> > because it bypasses the normal matching checks.  Also, all the numerous 
> > syzbot bug reports coming out lately have involved weird bind 
> > operations, not unbind.  Unbind should pretty much always work.
> 
> "always work" is tough due to the races that can, and will, happen for
> many non-hotplugged bus devices, as syzbot is finding now.  We shouldn't
> require this, as again, it's a debugging thing.

If a driver does not support hotplugging, shouldn't it disable the bind 
and unbind attributes?  (Is that possible?  If not, it should be.)

But if a driver does support hotplugging, unbinding it should definitely 
work every time.

Alan Stern
