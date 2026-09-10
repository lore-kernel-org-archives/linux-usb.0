Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA5488DB6
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048906; cv=pass; b=M6WOzUSCvI+2uDvzLnWxSDFxmqCuP3pyhEPkN3EVR/v7MrFuH3we19da2i1IRqN8sT2j/svREw6VAt+zad35Re5KClrDIQjTYIN7jRWfXIA2VhsLofjaU8HDM8AGubxEvgcbyy5i6T6eElk+UvJI/NHqsTu7PMJG7vCDnoi14Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048906; c=relaxed/simple;
	bh=757DtCJuY1QNjGvpICrLV3nMNss/QMd+lFaVPDK3Skw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j78s4cpVMWUzxHAgmA9+Zh7nhED6RJBb9XXeUZS2FkGW31qFPHrPCdEuVli7lcs/j0+sgp1d/eY/rF5GUdFTFnTm+TU7ykdUqMNrBvC+OMrsmY+5lx6ApETpad0LPtnAGhJ3ghw5bZgxoZluXjk8mM6DpvTDtb1UWrOtDUvadkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/kIZNHF; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/kIZNHF"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c7127a73dso7542306d50.2
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 07:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048903; cv=none;
        d=google.com; s=arc-20260327;
        b=CX2d6DijkP4UJHLPodJVUQpjHQD7Z+zgBmWJa/X9Dk6aFoz0GqMvk3NKCNNNOgknRy
         UD3Y0S7cdcoI/RkWxARMpiqvFldl0lKBJ3qLXAURW5Uk7Uzghk2UmX9Wvhc+4y1+mrho
         DrXeE6V7H6Fd1VY8lDNI5IfHauZArgojAGw7O/bLwgdx83OgcStcPNw46mrUXdINesaX
         3IC9jFov88E50InygiDs5/uhfliSLn1y5WU+Iqd6A4N9Afi71KQ4T6yiR3D87Bkcgx2r
         oJHP4XC5X9OTzCwQ1cY0Ok4PWzKVlde0kaz8FMsO/J87POpEnxCt/gVirf/kAbOvYDnC
         i3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVTBVvK/LTuo8gf4v/dR/3J2cjbjkp2QfVZbK4iqBUA=;
        fh=5iaGIWaK/pss5Gtf/0Gom/vCWegtmm1Ij4YtvZhnYWk=;
        b=VNJeGpZc1ZFHJmbq2GpTupRq7v0pOymotfE09Rxl4TxWTA5UH2yg9CLw7sUAxRSo2s
         56rJjuMevKFaRasVG8PtXCFfhdAWUZVNfMhpr0bgCXMc4v6kYC9hEVFQQEkowcINI/Ux
         RPdH2YIUgZJXRUa/gZBw3RjQXnNmoewdScWDhLxc5sge0T7SflnTzQezgkOIQbb7Ka/c
         eMCUvXTuSg4yWUTvQw+CCBGlpkiY+DPuYGKFpB+CjgH4xfnG1Wg8fIpiPGL9w2YA/U2W
         PYAdY5/CrA8hlx2CghBgSeDT4CYGu2hdQrq2OusAWYFdipWP4whsDYDzCCAHMSfFeaIF
         bYmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789048903; x=1789653703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QVTBVvK/LTuo8gf4v/dR/3J2cjbjkp2QfVZbK4iqBUA=;
        b=C/kIZNHFd6CjS/DALS1apqcXfcI4YWc2ioTDgGhforDU0v7dLqZT8mKZT74OjcF6H3
         2jLwZbbwMP+8MwXPFOMZ5gCr+1SkwTKIxg+lCwvYhNzSA0tTsZJgPRw6tH2vsY+0Zj/h
         QH9drmgRLHaCC1VZRFKSFBiuaxbInqUWCrl8TAezD1k1kzezp/VgdQ833XNUV+UgUjEw
         DFwXv14bAA5fMv5zidVr5l5d6HcN8b9rIU36XJ6n8em2ACWZElAUqkLdQG8bkzFxQdN9
         cQwt6y2RnhI1En8ntbjnlc7h+ljJt5LiFpVsSjAxmespcvc1R/yn3aUNaKY9uN8unMeX
         Ux2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048903; x=1789653703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVTBVvK/LTuo8gf4v/dR/3J2cjbjkp2QfVZbK4iqBUA=;
        b=TTpRi6A7jwYytxoRHJRu0glUhoUoaClmXs/b6CWDToCL6uVmJHzcNMPyvCSf2d5kBF
         kB/QGcVD3XcSCpviznpoa3YrDeGQ1ejPvxE0hTuJZd/ayjpMxqOPiksmr6rh2Q3pLS0a
         BAZ7NvaPg9wQIHy6WK+ZCe09rnH+eKYLVOgAyRXa1LlN4T1PIDEc/r8i/gKXD9jt2gUi
         D2BcYEd1lVbhRyOQ/Jj7oZvyrJBa8jw+7LW9qLqYtbLV40e+mPWt7EWY7Uv4kAaoXUU7
         vKBOl4h21MYK7RVUROLLp9AQCpn3h+S7OC5takFXef9955bUdEudyM7pXGFWbuOvXUfZ
         s1FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ4ZtJo1+s7doztwHrhKoCKrmnEmiIIl3jdVs38rG+80+SUCwjV+MAVnc4LmIYSLic3qK/afP/eks=@vger.kernel.org
X-Gm-Message-State: AFuF++k2BpURL6QfuCRyyc+j61sukh616TO6hVxR/ok2IAM2OWRUERm3
	Bg7PmXyDHVNugsHcJI8d0O9jzOGL7VY4saf4uNWV6GQKn90ubZ+ZS2X0/Rr+ewhrhs1VZKcOBah
	1VY3vtUUjp3zDA0SPhnpLh+r9iDWpPNg=
X-Gm-Gg: AYBFou10Y97rwEJr94uID5K3qpqc/syxTYX3DqIwy0aXfreABXBPGNDo7EiW1HFkKOJ
	yNKkL2Cq/gvat3zyrNPR/N8Pab3U1X6gHDVM0QunSSnUDH9dmQM6vBARIlXu5ITtRcG8vY64fgn
	V765ta37vUzLH6dOLjj+S2gp7nlN+kC5n/BrjqCrYFQ2ZHirYLH6ew2Ond19vXPwuMB9og6NiGh
	VfM66YlawY8FelFRweivvJ9ynmRgkJVnxk3qZ0vY9jx5Pl4mwaZLuoTEdja7m3q+J4C9bcFQAZG
	4kG/pEAu0g2dokNKb9UNUnhrcHMDVeIAwTto350JSAdbIBppr1YcMrkiXNytLAS6V72t8j5/Vug
	z2/iHdR4dIMgvTL8keWlo/S66lzenbpxuE5s9x/xRFKQ5HFuhFl4qmdXbmVSU+DMqSfzvHqq3ql
	rX8OrmCg==
X-Received: by 2002:a05:690e:184:b0:66f:c1be:84ec with SMTP id
 956f58d0204a3-66fc1be8749mr9414432d50.90.1789048902818; Thu, 10 Sep 2026
 07:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
 <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com> <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
In-Reply-To: <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Thu, 10 Sep 2026 23:00:00 +0900
X-Gm-Features: AcwNN1V6_1IfAu83Vxg6wMCAVqhduCS26yaYX8_GJMz2wtDNO_vaTq0-kfaHAeE
Message-ID: <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for the second patch.

> In your earlier testing, didn't you find that with the unpatched driver,
> the driver module's usage count remained elevated as long as the
> ep_user_copy_worker() was pending on the workqueue? And therefore it
> was impossible to unload the module while a work item was still queued
> or running?

To check that point directly, I tested the unpatched upstream copy-work
path using diagnostic gates at two points in ep_user_copy_worker(). The
module usage count remained elevated when I held the worker at entry,
before iocb->ki_complete(). When I held the worker after that call, the
usage count reached zero and the module was unloaded before the worker
finished; the kernel then warned and panicked. This suggests that
AIO may not retain the file reference throughout the worker tail after
ki_complete().

> Could you test it and verify that it prevents the problem you observed
> with only the first patch installed?

Yes. I applied your first patch and then your second patch to upstream
v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482.

With the first patch alone, I reproduced the earlier module-unload
failure with ep_unlink_worker() held at entry. With both patches applied
using the same reproducer and ep_unlink_worker() entry gate,
gadgetfs_unbind() reached the flush point and the ep0 close remained
blocked, while unmount and rmmod attempts were rejected. After I released
the worker, the close completed and subsequent unmount and rmmod attempts
succeeded. Holding ep_user_copy_worker() at entry with both patches
applied produced the same result.

I also tested the boundary where gadgetfs_unbind() reached the flush
point before the completion callback queued copy_work. After the
callback queued the work, I held the worker tail immediately after
iocb->ki_complete(). In this ordering, rmmod did not complete while the
worker was held; after I released the worker, rmmod completed cleanly.

I reran the exact pre-queue cancellation matrix, the original
null-ptr-deref reproducer, the directed cross-CPU UAF reproducer,
deferred giveback, forced dequeue failure, the earlier NULL-endpoint
case, payload checks, and CPU hotplug. With both patches applied, all
produced the expected results without a KASAN report, Oops, or LOCKDEP
warning. Strict KCSAN did not report a race involving GadgetFS or its AIO
work functions.

In my x86-64 QEMU and dummy_hcd tests, the second patch prevented the
module-unload problem that remained with the first patch alone. I did not
find a new failure attributable to the second patch in these tests.

With sincere appreciation and great respect,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 9=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 4:03, Al=
an Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 07, 2026 at 10:00:00PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > > Is it okay to add your Tested-by: tag?
> >
> > Yes, please add:
> >
> > Tested-by: Minseo Kim <neck3922@gmail.com>
>
> Will do.
>
> > Thank you for the time and care you have put into this fix. I have lear=
ned
> > a great deal while working through this issue with you.
>
> You're welcome.
>
> In your earlier testing, didn't you find that with the unpatched driver,
> the driver module's usage count remained elevated as long as the
> ep_user_copy_worker() was pending on the workqueue?  And therefore it
> was impossible to unload the module while a work item was still queued
> or running?
>
> This patch introduces the possibility of that happening.  Therefore I
> would like to have a second patch, which flushes the workqueue and
> prevents the kernel from trying to run code in an unloaded module, ready
> to submit along with the first one.
>
> My version of this second patch (meant to apply on top of the first
> patch) is below.  It is closely based on the version you wrote, the main
> difference being that it uses a single workqueue for both work routines.
> Could you test it and verify that it prevents the problem you observed
> with only the first patch installed?
>
> Thank,
>
> Alan Stern
>
>
>
> Index: usb-devel/drivers/usb/gadget/legacy/inode.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -237,6 +237,7 @@ static const char *CHIP;
>  static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock operation=
s */
>
>  static DEFINE_SPINLOCK(aio_lock);      /* Protect aio cancellation info =
*/
> +static struct workqueue_struct *gadgetfs_wq;
>
>  /*----------------------------------------------------------------------=
*/
>
> @@ -514,9 +515,7 @@ static int ep_aio_cancel(struct kiocb *i
>                 spin_unlock_irqrestore(&aio_lock, flags);
>                 return 0;       /* ep_aio() will call us again if needed =
*/
>         }
> -
>         priv->cancel_state =3D AIO_UNLINKING;
> -       spin_unlock_irqrestore(&aio_lock, flags);
>
>         /*
>          * We are called with the aio core holding iocb's context lock.
> @@ -527,7 +526,9 @@ static int ep_aio_cancel(struct kiocb *i
>          * For this reason, do the dequeue operation in a work routine.
>          */
>         INIT_WORK(&priv->unlink_work, ep_unlink_worker);
> -       schedule_work(&priv->unlink_work);
> +       queue_work(gadgetfs_wq, &priv->unlink_work);
> +
> +       spin_unlock_irqrestore(&aio_lock, flags);
>         return 0;
>  }
>
> @@ -597,7 +598,7 @@ static void ep_aio_complete(struct usb_e
>
>         if (new_req_state =3D=3D AIO_COMPLETED) {
>                 INIT_WORK(&priv->copy_work, ep_user_copy_worker);
> -               schedule_work(&priv->copy_work);
> +               queue_work(gadgetfs_wq, &priv->copy_work);
>         }
>         if (cancel_state !=3D AIO_UNLINKING) {
>                 usb_ep_free_request(ep, req);
> @@ -1773,6 +1774,8 @@ gadgetfs_unbind (struct usb_gadget *gadg
>         spin_unlock_irq (&dev->lock);
>
>         destroy_ep_files (dev);
> +       flush_workqueue(gadgetfs_wq);
> +
>         gadget->ep0->driver_data =3D NULL;
>         set_gadget_data (gadget, NULL);
>
> @@ -2245,10 +2248,17 @@ static int __init gadgetfs_init (void)
>  {
>         int status;
>
> +       gadgetfs_wq =3D alloc_workqueue("gadgetfs", WQ_PERCPU, 0);
> +       if (!gadgetfs_wq)
> +               return -ENOMEM;
> +
>         status =3D register_filesystem (&gadgetfs_type);
> -       if (status =3D=3D 0)
> -               pr_info ("%s: %s, version " DRIVER_VERSION "\n",
> -                       shortname, driver_desc);
> +       if (status) {
> +               destroy_workqueue(gadgetfs_wq);
> +               return status;
> +       }
> +
> +       pr_info("%s: %s, version " DRIVER_VERSION "\n", shortname, driver=
_desc);
>         return status;
>  }
>  module_init (gadgetfs_init);
> @@ -2257,6 +2267,7 @@ static void __exit gadgetfs_cleanup (voi
>  {
>         pr_debug ("unregister %s\n", shortname);
>         unregister_filesystem (&gadgetfs_type);
> +       destroy_workqueue(gadgetfs_wq);
>  }
>  module_exit (gadgetfs_cleanup);
>
>
