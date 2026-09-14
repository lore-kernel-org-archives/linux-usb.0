Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8302035C6A1
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401669; cv=none; b=SK5rKh+ACCjk9nlgsIF/OhH5KguHinF+Qh1FVLaUIeGHmYuR9mxLUkHV0BLGBJBbr0op61cgkQf4GyxVw0U8ZSO+xNAkdJMrnBBhhrE5G8u8+xvTfm6Sa661buDbumQtfr/JWJofe/CkYp27LhfWxmmChOpRpwjGKQ3KctqUHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401669; c=relaxed/simple;
	bh=CbP2Yc6QOC1TaqWXpk9VKHDdPov5UCKmBGqZZE0al8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egVarMujyaiCeRz3EjFWUNeegjPB17qKsG/f7TYrsr2FqAB/AZDfMR4IxQESou82xuFCWvL95z9qt4wgXGIp528tKUqm+hsiVoF/fxI/sWHoF3ac3LwRy6R+VhlHAkBpFr6JOa44xH7bzBE8vIL+UDtPsha7Md9Y3OVERK0vs6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vSGiwET2; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vSGiwET2"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-470417e5b52so1718926fac.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789401666; x=1790006466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBllaTOuazudRqgAdFSA/MXIeDVbKXR+ECVpXkcNDSM=;
        b=vSGiwET2fUu4tZIrwbrvjd1XfIol48xkbKwSmnIaYR6TIGf748zgIy1ek7Evjfk2MO
         tL2uZPMFSU0yvwjg1Z+1kln/umFBmrtYAV8XRSsfocvdCjHMONWUMGtAwtxXxpZbtOHt
         90+coEUKXcKam3xymzy0s8nI6pfAk7VwWvfdsmbP92qZrcde5H1OCjLJbberfpom+hxh
         lMz1WzVODDguEvgJaguke0y6H12WJOHi9rzq09ejLbEulMUzx/gN0CrNi11oIEXz6jdd
         Z2WuuRCoLu5o/tjKM1zY6I1xqRBIPL/JE6uru9lcsa1rJgy+qATJxtI+x/Yv2bqGkxm8
         x+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401666; x=1790006466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBllaTOuazudRqgAdFSA/MXIeDVbKXR+ECVpXkcNDSM=;
        b=nCbylScvPTmdySt4mGhMrMGcZpD4S7RZu/J/LQpsXFox3nAA0KLeYpdWUQoYok4jTN
         vOJ+kSzfMb3At3aS3AGwRPV7qT0+dwbKmOq3I0CVzKWyx6r7rmy09QoiIcdnTzqIuY4t
         YCGa03Ih0SahQishjM1mSkSbs9yQFrKSoxLVHDKj4p2cTdBwUd9Nr9VhMFpV+0n5IjZ7
         bQsIbJZR2MTQXSZ0Yjq98qQpr++5YhJX0NHAovzbVOK2fb/U17e/Afd8dEvfwVDurIsV
         YIAtGM8VWfLVJVOTLfoxv3FAF2QS+4F0+jlIyniuOWBssPh0gT+rTYTqAdaM1Pb0cELM
         GZ/g==
X-Forwarded-Encrypted: i=1; AKwUvBwMPUXJQj+XMzfwvGj3BsgULCFbRV6Fh/40DRL2xkbXzlMCC2d298JRxn3fmcrX862ebD3Nh0w86BQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m1l9hEZaxWGlbBBB37dwqYNW8WAOVn8FdfMgUwRuiRTdu4nNP8
	d7vlagEfL3BHJhNVQK/aTXXJHCB2DAgys+K9XdUuoUkZOOmjIlWckZO5W+lW4GrgvukjBbDBQ+F
	V6JavAQ==
X-Gm-Gg: AYBFou12HK08PZmYQn+b3uhKodA2Yz5amBFNMzpV7NU8uuMFal0mTtMWd7Svwa9kvzJ
	F+XHIgpcorw4Cml9IAtToO3ukfwneJJmXgWaY44E2miY9KPwWEsi3Ac9lOEXYF6hHa0mHKmSdba
	ixLxHngDpDnrJoM/bbZGbuzVtjd+Do4y0Dx+JzUEpoOkiR+sJFB4LDzdQuCgitzu9R5HJOoEvFd
	CPeDnbM68rxoeYqrqqG1FU9nEGuleFt+dYFUsU4XSC1v9H7epsvGo7lMNSHlhNzNTeM3q1lTWVq
	4YIeyBikVvVyHEnxYdOYX9bCXXiNASaDSXRpHokd6h0W1/u1VnDuzbmOXLQT8lQ+Pdiq1hWNR0R
	QXDZe90meaPa6HJipyUDimMzWgEHbr19PZ/Yl+ak24VGRv24SBIF//yncKrL1Rs8dwk97OUJQGS
	UbjGVaXLigeuNl91Rj0tl8bkwEdXcWGCnu0xEtcvg8f3jC5MC45/gp/CU5H5F/dZXDKyyxCIQ58
	82091wZ+7E=
X-Received: by 2002:a05:622a:1786:b0:530:b2e2:903b with SMTP id d75a77b69052e-5310d0bc66emr40415231cf.59.1789401655453;
        Mon, 14 Sep 2026 09:00:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca3098easm102330871cf.3.2026.09.14.09.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:00:54 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:00:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
References: <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>

On Mon, Sep 14, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the revised patch.
> 
> Following your explanation, I focused this round of testing on how the
> revised patch handles module lifetime.
> 
> I applied your first patch followed by this revised second patch to
> upstream v7.2-rc1, commit
> dc59e4fea9d83f03bad6bddf3fa2e52491777482, using
> CONFIG_USB_GADGETFS=m for the runtime tests.

...

> I also held ep_aio_complete() immediately after iocb->ki_complete() on
> the PWRITE path that does not queue copy_work. In two runs, each starting
> from a fresh boot, after the reproducer consumed the AIO completion event
> and closed all GadgetFS descriptors, unmount remained pending, at least
> one concurrent delete_module() attempt failed with errno set to
> EWOULDBLOCK, and gadgetfs_cleanup() did not begin while the callback tail
> was held. After I released the gate, the callback returned, unmount
> completed, and module removal succeeded.

Hmmm.  Do you know where the unmount operation was getting stuck?  Was 
it the usb_gadget_unregister_driver() call inside dev_release()?  I just 
want to be sure about this.

> In another cancellation test, both unlink_work and copy_work were
> outstanding on gadgetfs_wq when rmmod entered destroy_workqueue().
> Releasing unlink_work alone did not allow cleanup to return; it returned
> only after I released copy_work.
> 
> Using the GadgetFS source with both patches applied and without the
> diagnostic gates or markers, I reran the original NULL pointer dereference
> and UAF reproducers and the relevant AIO cancellation, payload, teardown,
> CPU hotplug, rebind, module reload, and partial read stress tests. All
> completed with the expected results and without a KASAN report, Oops, or
> LOCKDEP warning.
> 
> In these x86-64 QEMU and dummy_hcd tests, module cleanup did not begin while
> a callback still had work to publish, and destroy_workqueue() waited for the
> remaining GadgetFS AIO work once module cleanup began. I did not find a new
> failure attributable to the revised second patch in these tests.

That all sounds very good.

> Thank you for examining this issue with such care and for the time and 
> effort you have devoted to it.

And the same to you.

Alan Stern
