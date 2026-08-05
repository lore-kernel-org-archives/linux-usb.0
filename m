Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF55481658
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946649; cv=none; b=UgWxaFfSogqaZaxJI003l6b0l3GwSj60K3j5jKRJYPq5KuyXjE02RzwctDbkldbAbiyKFFvLQvknNnFbCEvekdTOuMBQQG4G/Bu9ROKPQxdSMG0xy4x1mGrq+r9qda7LFRdV6GewF0GXpehNNyM6lXq2UTdvLf1O8Nao59AaH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946649; c=relaxed/simple;
	bh=OAADWsfdBo0Uim87jehyAZ8PC+TKLvbPVg77F5H+pak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVhkI+MQPMmtmc5jMAzyuAL7nowEMDPSGXczQPg9AboR4lFWKDuXIHi+UwFf6fLjhwFj7CzTpla0Jrm/cGHp9u/alX1v164szN+K56i+rU5ijlm8eZfDhdA0D69lYyKZxhsQl5CvPA6oeRZFefnAyuAt2uHaKn19iwf1+yJARgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=a5VFbjaN; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="a5VFbjaN"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c928bf172so7422621cf.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785946646; x=1786551446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tlYIfw7UgeV1LdhUIDSdgdpGW/sTREmk4wncyxasw2w=;
        b=a5VFbjaNHhzeTAw/P10zEynwvIhsQMiFv7apyU/uXY6OBT9rmCsBb+IXp3ECw1Wza6
         sRkDdY6x7ZrkpBKQBo8/lZeu1SP6BseHOSASjKi4pkmaxlHF1x34qWOdF+w/jWJYQrQW
         eAmy4IItNYtd9G8b5V7NGYynlYPtbrvknhATsFXUQufUUNkzRw+I+AVdZHlmX3W248Wv
         p/qPQiYGt7FzCQUR6i7sEXtIpMKfIKXGBDE/c/D10unH71H4qIB/eYErWl5q+477pnRC
         cgollvyRKpyYWKHAWKXe4eYJekDqHXU+vOA8RucnLatNbL18EwxYEKRpg2ZMT5oX1B+s
         BI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946646; x=1786551446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlYIfw7UgeV1LdhUIDSdgdpGW/sTREmk4wncyxasw2w=;
        b=evYMY7LA5ubNj74VxvFeMGEgYDWSaorfU8VBVoIn3RiIjkG2CvDsbyWQja5dpb6u4o
         hP2iD1ZPuJc+jSW/5umhzQ6wTcaj0dr+js44Mx1B7R7BaFi1A1V8wPJjZX1VgtDLdiRs
         nZsbyEEXhWJIFJsrVvwbx/UYtpYaalS6Jb7MDzcJ49vUgTOm6wt6n0iMbLheCmOVKhq6
         h4Mem6yIgO138RpxCcyU7G7hBiEWjy1Wwias193ryNah9Z69zez3x10C1+6S96Ene+PU
         Guk/2ncU1pQLuB2qnZEDB8N9Kg1wIVwmE3I8aJ+pXe8a20s87dMAV3l1GHOLLN+9JguZ
         8cXg==
X-Gm-Message-State: AOJu0Yzc1odEfdfTYBw2RSpAXo7n44aO/0Aq/QXprra5d2bQ0mFvDsvD
	CAVlGaeS1vXyZ5Hp541uViTMRaVXP1dSxoaKJYr9EkLNUztfszbhRC/RbKjjVaqkew==
X-Gm-Gg: AR+sD128JrVFAjVUNGTNIkfV/WIxnu7H7S6kvwqbMV4gBoz/0PzWSX65kKKDXgPi/i/
	3KCh1kBuPgMtldMXDVUXILk4veFZ5yV6v4D9L53EgF2XICiIN1vpfPt/Q6/PuajcjWU0dnQN/vO
	Z3vE4p5H4xOMJts8ionO2dwYScJdNOgVYuiBuvh6fkM9B4K87VM2oTgcRqOAOJXcX7+eKDc2U7i
	hGFXk9R1SB1HanWvZSF5seEroIPyeV5QSOxYNtmIYSXcvy69BiQyvz1+Kp7XI0FB+FDgxVeEka7
	gKWaD1TejJ4EjGsmVXedhW0atwlxhb5H9UFzPsiANj0jzh5t9L6vVbEiksUQL6ZI47uKMt28EJ7
	NWAWpHd11ZmgiGr8/XbBhq0VW2RWXg3jecd0luA9dIXy/2HEOQH6on0B+Qp++6O/OxbI4t1cius
	5Rs62y8GEsCrUGmRgG+1RCGbXUGw7LgjVucZxg53+EJBhCEQDmMZ8IQHCaMtGuAw==
X-Received: by 2002:a05:622a:4e07:b0:517:307:4f1f with SMTP id d75a77b69052e-52ce6221396mr80334171cf.44.1785946645858;
        Wed, 05 Aug 2026 09:17:25 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d773sm28996446d6.5.2026.08.05.09.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:17:25 -0700 (PDT)
Date: Wed, 5 Aug 2026 12:17:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
References: <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>

On Wed, Aug 05, 2026 at 08:12:51AM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the updated patch. I applied it as posted to upstream
> v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> In my runs, the post-queue ep_aio() UAF reported against the previous
> revision did not recur with this update, including on a diagnostic build
> that deliberately widened the same window. I also did not observe the
> original ep_aio_cancel() null-ptr-deref or UAF signatures in the timings
> I tested.

But as you have seen, there are still other problems in that driver.

However, I'm not sure it's worth working on them.  Greg KH is talking 
about getting rid of almost all the drivers in the gadget/legacy 
directory.  I don't know if that will include the gadgetfs driver.  If 
it does, trying to fix up the driver will be a waste of time.

> > The possibility I was worried about was that gadgetfs_unbind() might
> > complete while ep_aio_cancel() was still running.
> 
> I was able to reach this ordering in a diagnostic build. I paused
> ep_aio_cancel() after usb_ep_dequeue() returned and before the
> cancel-side usb_ep_free_request() and put_ep() calls. The
> pointer-correlated trace showed gadgetfs_unbind(),
> usb_gadget_unregister_driver(), and dev_release() returning before those
> cleanup calls and before ep_aio_cancel() returned.
> 
> No KASAN or Oops occurred under dummy_hcd. The trace establishes that,
> in this instrumented run, the unbind and unregister paths returned before
> the cancel-side cleanup finished.

Yeah, that's not good.  The unbind path, and in particular, 
destroy_ep_files(), should wait until an endpoint being destroyed is no 
longer in use.

> > Even worse, the aio file descriptor might get closed and the entire
> > module unloaded from memory while ep_aio_cancel() is running on another
> > CPU.
> 
> I also tested this case with CONFIG_USB_GADGETFS=m. The only difference
> between the built-in and modular test configurations was
> CONFIG_USB_GADGETFS=y versus CONFIG_USB_GADGETFS=m. In a diagnostic run
> with a longer pause, gadgetfs_unbind() returned while ep_aio_cancel() was
> paused. At that point, the trace harness found no file descriptors
> referring to /dev/gadget/* in the process's file descriptor table, and I
> then started the unmount. While the unmount was still blocked and
> ep_aio_cancel() had not returned, the reported reference count for the
> gadgetfs module was 2 and an rmmod attempt failed with:
> 
>   rmmod: ERROR: Module gadgetfs is in use

That's a relief.

> dev_release() and the unmount completed after ep_aio_cancel() returned,
> and rmmod then succeeded. I therefore did not reproduce the module being
> unloaded while ep_aio_cancel() was running in this path.
> 
> Several existing references are relevant here: the AIO request holds a
> file reference in ki_filp until iocb_destroy(), the endpoint file
> operations and GadgetFS filesystem type both specify
> .owner = THIS_MODULE, and ep_aio() takes an ep_data reference through
> get_ep(). The reference taken by get_ep() keeps ep_data alive at least
> until its matching put_ep(); the final put_ep() also drops the dev_data
> reference held by ep_data.

The ep_data and dev_data references don't help pin the module, but the 
ki_filp reference does.

On the other hand, if ep_cancel() gets split into two threads (which 
will be necessary to eliminate the locking cycle mentioned below), its 
second half could end up running after iocb_destroy() is finished.  This 
is yet another reason for making destroy_ep_files() wait until the 
endpoint is no longer in use.

> These references do not by themselves establish whether the UDC-provided
> usb_ep object and the request allocated from it remain valid long enough
> for the later cancel-side usb_ep_free_request() call to be safe after
> gadgetfs_unbind() and usb_gadget_unregister_driver() have returned. The
> outstanding-AIO reference count you suggested, or an equivalent teardown
> barrier, may therefore still be relevant to this narrower lifetime
> question, unless the USB core already guarantees those object lifetimes
> through this ordering. Any such wait would need to avoid blocking a
> disable or giveback operation needed for an outstanding AIO to finish.

AIO doesn't wait for disable operations, only giveback.  I don't think 
this will cause any new problems.

> Separately, in the matched LOCKDEP run I did not observe a cycle
> involving aio_lock. The patched kernel reported:
> 
>   &ctx->ctx_lock -> &dev->lock#2 -> &ctx->ctx_lock
> 
> In that report, one recorded dev->lock-to-ctx->ctx_lock dependency comes
> from kiocb_set_cancel_fn() being called while dev->lock is held. The
> reverse direction is exercised when free_ioctx_users() holds
> ctx->ctx_lock and a synchronous dummy_hcd giveback enters
> ep_aio_complete(), which acquires dev->lock. The cancel-function
> registration placement was already present in the preceding patch
> revision and was unchanged by the one-line update.

Fixing this will require moving ep_aio()'s calls to 
kiocb_set_cancel_fn() and usb_ep_queue() outside the scope of dev->lock.  
There are several other places in the driver where the code does 
something similar, so this should be straightforward.

> The matched unpatched control reported a direct recursive attempt to
> acquire ctx->ctx_lock in the same synchronous-giveback call chain. I
> therefore regard the synchronous ctx_lock re-entry itself as pre-existing
> rather than as a regression introduced by the one-line update.

To fix this, I will have to put the second half of ep_cancel() 
(everything from the usb_ep_dequeue() call to the end) into a workqueue 
routine, rather like ep_user_copy_worker().  And to avoid other locking 
cycles, the rule should be to allow dev->lock to be acquired while 
ctx->ctx_lock is held, but not the reverse.

> These reports confirm that, under dummy_hcd, the dequeue giveback can
> re-enter the AIO completion path synchronously. They do not by themselves
> establish that GadgetFS AIO completion must be deferred to another
> thread, but they identify the synchronous callback chain that such
> deferral would be intended to avoid. I have included both reports because
> this ordering may also be relevant to the design of a teardown barrier.

Yes, thank you, it did help.

Alan Stern
