Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D083BB669
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019686; cv=none; b=JpIvXO4UKWaS7wmmWN6mxJhIiA+ZjK30hwCZhgTnG9meWBbLmyRuP95d8HvywGmP+ATUVywwDskgNOCkg/KNN4MZfSVQQmEAe/B+P7aDovFpyTS7K1GOW4qIbZXhCDZVSxIrHcjUo13akHC/JLqFamMrEP7NwZ43myfLdEjnWpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019686; c=relaxed/simple;
	bh=jQSyP8+U7c9uD/qVhiaf5UWCI99IjG2iqT44kQWk8TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3mV/6tk2LAs4nXlzFoBEe+XEDfuYQ+/4DbiuA5KwM8AtNViSw5TLicIIlkZDAQmcLAJevU6Qn8zak/wtxlWTc0CI8P52IS4zhPqYJAGjQeuXyLypwCc9D7wOrIV9pC+MeB4wFbz67eP2iDJlv1IxVwAnaW2I5yuS0FHznqPMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XQ43c005; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XQ43c005"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52d5bfa4bafso22886931cf.3
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788019684; x=1788624484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cv18aybuGBm7/t0+rnhtd1UHtg1560Ay8t97cC9ypmg=;
        b=XQ43c005HbAFRXLC/1C3GnXpq95SbvAjmQETKYjV4PMnkBE/GTCWc5Vnneu+XKRfqO
         EMs9CbB+e03H8WbxF3DXturbkWAzzrR0MI1WnIm+cmhLiPX1FoaA4yIN7/q4FvGfFbeQ
         BfQwweJdq0/BECyj2Iuc0zqYsRyaHaiKeMFy7s/GWfCKBs6z2QtY7RSbqIviDlAwm6/5
         n2e+8j2J75qzdoA8AgjPSU/Mu8qQXKxyZp64IOEFg4oOaIfVFQKOKSgWIw+tnX1SH9hS
         Kz7A/xjuT11zQrZOvKLswMikWUKduTR8ireNifh4yM7JgzUijsv+lby72hKs4WapjfLe
         3Q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788019684; x=1788624484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cv18aybuGBm7/t0+rnhtd1UHtg1560Ay8t97cC9ypmg=;
        b=F4bgGUXsGi0TV15dLOduQUHawQGHUBEUQrgGjVVPUTMYFLSZwOm3eBtXjdRBylFnFU
         QIkOOPeOvaJ3BaS71Re9EpjU/yMyLIk7TQ9g9LW5ELiseBUNC8ukT7dmfudTwvuL7RmC
         LFrP/MOf45cJAuKKwhXrcaiNKdqAXJmD1UUGR1Oj2FhVd+ddq/rOPII5+Fetvok63fbH
         NnzwPhm02ix7evb5Op0u2wU4wWdY1g1PTf/O7cPN1UGflqXyyQNsIv/S6x9P9cVlUW//
         TwQNtMgIIaYjj4SjWSCOu0XmNHiG/ZitqkQcwJJCUP93NYw8Q1xhc/TVIaDBCSGcyx5T
         +YkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJYhUtgTnysbIOTOiNJRQjqh1qWCsKyyTrpe+vDAKSQ6BX7BxA6u5qrbuH5Bjayrhvx1W9BnAP4O8=@vger.kernel.org
X-Gm-Message-State: AFuF++lVOwD3uhfoWnZAR++xk4eSrVlkWlIyPug/GG17S4NXCfG5lhJY
	zDPI79HXdOejBARL5QCrgbFU28K5I0qUWlwB9vVdmGzNdcUiU2y3M8jZXajoAvb1CQ==
X-Gm-Gg: AR+sD13NQBObrzgaCZ8cuRUfoWwA15tWDiD7MO7dIym/aM4FIs9HdxhhnT4aQRV9xCj
	gE628VR7qrqvkuX+JZarwHc0JCZn0N8q2DfER4Wo5SBTsOnyaRxTsla5bI5nFGWCwMp3spbBZln
	iMKhLc7VRm5WYOykQ6H8BQLE6JwexXRXRvZcM7eFsjAYkcL+Zw2Jc0YOhSIjIl1eVynqYoA5Ek7
	xXXWPtujl/fJcHBpizsgg1G8N9EIaUyD/9W+ZxZbSUWEwyNd391qennEi/QsutMI+JjcBIK8xKZ
	0wrZfbp7XSuCEeIO1roQzf87ldhvUN5CzTSevNsqDkzGG2WmDXem6MrchcfuFlcl3LFsdjXYXJx
	4TfvWIl7+YUue2OGvS/R+zWdxP8OTz3jsyiKcU2sAQ/3+rmcY4G66YQ5tfpeZgtS+w06PJixulT
	hGT95xrFre4/carWmPZPu6TiC5RJGYSopS/fGQiKdXXqU8zR1G9BG4MluBSemNZQ==
X-Received: by 2002:a05:620a:a18f:20b0:937:e422:85cd with SMTP id af79cd13be357-939137af78dmr1341500885a.7.1788019683790;
        Sat, 29 Aug 2026 09:08:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a6be1sm391717585a.27.2026.08.29.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:08:03 -0700 (PDT)
Date: Sat, 29 Aug 2026 12:08:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: neck3922@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
References: <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>

On Fri, Aug 28, 2026 at 03:30:10PM -0500, neck3922@gmail.com wrote:
> Hi Alan,
> 
> Thank you for the revised patch and for explaining the intended use of
> the saved endpoint.
> 
> I applied the patch as posted to upstream v7.2-rc1, commit
> dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> I first tested your revision unchanged. The IRQ-state fix and saved
> endpoint behaved as intended. The exact pre-queue cancellation matrix
> produced exactly one expected completion in every case, with no KASAN,
> Oops, or LOCKDEP output. The original ep_aio_cancel() null-ptr-deref
> and UAF signatures, the earlier ep_aio() submit-path regressions, and the
> teardown NULL-endpoint failure did not recur in these tests.

All good results.

> > I think it will still be necessary to flush the workqueue after
> > destroy_ep_files() runs.  The best way to check whether this is needed
> > would be to put a long delay right at the start of ep_unlink_worker()
> > and then run a test where during that delay, the test program closes its
> > open files, unmounts the directory, and unloads the gadgetfs module.
> 
> Using CONFIG_USB_GADGETFS=m on the posted revision, I inserted a
> diagnostic 15-second delay at the entry of ep_unlink_worker(). While the
> worker was delayed, the test process had no open /dev/gadget/* file
> descriptors, GadgetFS unmounted successfully, the gadgetfs module
> reference count reached zero, and rmmod succeeded before the delay ended.
> The delay was diagnostic only.
> 
> When the delayed worker resumed, the kernel warned and then panicked. The
> serial log showed an unresolved work-function address and identified
> gadgetfs as the last unloaded module:
> 
>   Modules linked in: dummy_hcd [last unloaded: gadgetfs(O)]
> 
> Thus, in this path, a running unlink_work item does not pin the gadgetfs
> module. Teardown must quiesce pending or running GadgetFS AIO work before
> module unload, or otherwise retain the module until that work completes.

Indeed.  Quiescing won't be easy to do; it will just have to wait until 
the work is complete.  In other words, flush the workqueue.

> While rerunning the directed cross-CPU test from my previous message, I
> found that the underlying lifetime race involving ep_unlink_worker()
> remained:
> 
>   BUG: KASAN: slab-use-after-free in ep_unlink_worker
>   Read of size 8
>   drivers/usb/gadget/legacy/inode.c:489
> 
> The faulting statement was:
> 
>   put_ep(priv->epdata);
> 
> After AIO_UNLINK_DONE was published, completion work could free priv
> before the unlink worker's final accesses through priv. Saving epdata and
> ep before usb_ep_dequeue() eliminated the failure in the directed test.

Ah, yes.  I should have realized that last time.  I just didn't think 
hard enough about how the ordering could interact with those tests at 
the end of ep_unlink_worker().  (Or maybe I did and then forgot to 
include the changes into the patch -- I can't remember.)  Anyway, my 
version of the patch has been updated accordingly.

> Based on our discussion and the results above, I prepared the cumulative
> patch below, incorporating your latest revision. It also fixes an
> existing native PREAD issue: the to_free predicate could skip copying an
> ITER_UBUF payload while still reporting success.

I'm not sure what you're referring to.  Are you saying that this test
in ep_read_iter():

		if (!iter_is_ubuf(&priv->to) && !priv->to_free) {

is wrong, for example, the && should be || ?  In fact, I don't 
understand the reason for the iter_is_ubuf() check at all.

Note that to_free isn't a predicate; rather it's a pointer to a copy of 
an iov_iter structure.

> During development and validation, I found two further ordering issues.
> In the existing completion ordering, request cleanup could overlap
> usb_ep_disable() during final endpoint release.

Yes, I know.  I understood that it was okay to call 
usb_ep_free_request() after usb_ep_disable().  Was that wrong?  Did you 
see it create any problems?

Note that usb_ep_disable() doesn't return until all the requests queued 
for that endpoint have completed.  So ep_aio_complete() will have run, 
but the work routines may still be pending.

>  Separately, an
> intermediate cumulative version allowed gadgetfs_unbind() to pass the
> completion-work flush before a callback had queued that work.

This is probably because you were flushing the workqueues at the wrong
time.

For the final submission, I think the workqueue management stuff should 
go into its own separate patch.  Straightening out the various AIO races 
is already complicated enough by itself.

>  The
> resulting patch addresses all three issues and applies directly to
> upstream v7.2-rc1.

I'll review the patch later.  For now, there's two things to mention.
First, when you create your patches, it would help to add the -p
option to the diff command.

Second, why did you change ep_aio_complete() to make it queue up
ep_user_copy_worker() even when nothing needed to be copied to
userspace?  It's a bad idea to run a workqueue routine if it isn't
necessary.

Alan Stern
