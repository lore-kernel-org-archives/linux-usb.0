Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8D456DE2
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 19:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786996165; cv=pass; b=W2w+oSRVe8pv3Pm/qmv2FuX+3WTJ1iNNQk9uPn8+gdVUgM6GAixTOld+USVyB4u3wmFUBUMSwuQiFP67BzHfssFz30x+6NOlQT4cLbznNYN4wJZaYLVEWhSkQZUNmMuSmgFlG9zbbF519ebrZxW24WBOOWMlD5PBp2n5OrNh7+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786996165; c=relaxed/simple;
	bh=DOCmLeKszjbZ33Y1Zjx5YRGY+ULLuXF+qlkAef4u308=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MafcmRkOJmqwqIx98MNbYLMDh13EkitJkyqaGSwI5u7NSwG+yX7k4rulKzGnK7SRsfipwuUS8VvTNR+nNKKqeQzmn2OrsRrT+Cea3wNqD7vTNKvZQKXUlNObI1FuoW13A+X1zmTTP9sYqtJYWxcu2E4pczjPEnVgfPkEWoeAb9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOOoo5Op; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOOoo5Op"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so32770296d6.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786996160; cv=none;
        d=google.com; s=arc-20260327;
        b=Dmb7ROUOblIk7RSsoK0VWn+bC8Ns6eRJP9Wul+y0nCEjivZxP0N4naRicMnhf5rzxx
         g5xBC/S72Fm3YJZN3RH+AFjgjsao/PNRUSiywxPnXyAH5vTO1v23yqCNThx8xtNkLAcj
         4LnUzpe5J7+Gw5bQejRydGep21hr+Oa/Pa+r00sOEDVtpQW4UR1tdld9HCo3hIDWFZ1g
         EfzC80qFM54to9PjNnt+/51zPXYCJwE5zSB4AvWDl4NtFjhtjClT99r4YlTQepDM+Fhx
         Ygpmi33Ed1N1wcYk+fXke3TT1eYftOM4txgY6q85y+KbcoIkRhJwl4GF/+0TuJHXm5UN
         mjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JrAM9Ce2P/rC1YhLf4YuViSvOIC1Bz1R4pY7l5/pW5c=;
        fh=mh8NYASwzA2i6K4FkEfYZJwbU2E9u9YcBCUfmS3B4dc=;
        b=FiDJkPg0mpe+ltnG96avTUbG0XC231a4Bd7k9OwODEon+OVJjf1GE+3WzBBd6ZuCYP
         XP3GJKiqSUZH3zIqv8Ivxhwflad/mcmV2pKVyAAGWqnQbJq7GVzyATTtLTVO1IZf/eUb
         7OTHspdNUaAU5T5Fc63UTTM6iBr30oI9JALGC3KIjba0WfeNG5AJjtP4CMmsxmwBg+wL
         Oilc28M7NKQdbLH9qXOSvi60qfN+KnG90DccS7vHCwVkCXDxIeB73PfsxJ/qP80I9aYN
         np22PHa+Wh+XidUbUBwN+BN5fKGa88ajrgQ+vi9sOvCzBwH+TK0tSHNpoPZ9VReaspQB
         MaAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786996160; x=1787600960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JrAM9Ce2P/rC1YhLf4YuViSvOIC1Bz1R4pY7l5/pW5c=;
        b=MOOoo5OpQ+N7yZbPXt0Eck2iD5tcWlVQrY3pBquBCbMctP1j2fLDSyqomZUgxvggVA
         I5KG5sH7ZX7/ExPa5vCvKGbcSyNsc1GDmaHmYwkY5C3XdAeqhYA8BglpRALsZLSwrDa0
         QymnYYTTgLmu6WIzzhVhnv9iQXJAH12jy0D1IPFMNRMuclt+gw3zBUPAoGXTdW8Hf7XE
         1cMo95PSIAjqTxUML87GXYF8TdFj3HPVFoQBtxE/g3k6JT80WObCAPDT2uDZGqJ7fvXe
         Uqgp0S8gshSjVM28dxY5tcMI3kq5IpfhgQKnLjr6gcQ4Rqgf2B1hDpK3t24NanZ4MOLE
         7Uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786996160; x=1787600960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrAM9Ce2P/rC1YhLf4YuViSvOIC1Bz1R4pY7l5/pW5c=;
        b=gp2ioBzGYbAl4vbMizw09lpGZdUMjOy3J4/sOEgpEPyRzyk+i8s+3P68wh5/wek9i8
         pas0f41173iRuY684YCKwNgjR5go2/WRNrY4XYNaxkiR864fSPemcQRUgH7FBmK6t6Uf
         nHSX9mGxAGAdWKayIfhXtUPcC0AUagRgU2Ux39aEH8Pg3PRXWRFy7fH9Y9lecZJ701jA
         TzfUTI95nrb0FHQZsJPqNGDlZ99HpD6WJX1KaDVVxZhLyE6R40DKwp3Lr0dn4X+eZvCx
         35Q7D1lsB094CBCjice3rWZxUfMa3bbYdhDzWSmjuCy3+DkgIEJUfSCW917fY9Bjb5aM
         iRZw==
X-Forwarded-Encrypted: i=1; AHgh+RqtiSG7Q635MnDCXDeEKs0DrvLCOJV0XYiuZdMXBniNeiL57rVf2PCS8RDf+BlydZkaeFlJbLksWqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFsNS9iIZQBURJ2A+qu9T+0EE8kozC+L8BrpvzfxgUq2BTdSb
	oIxnfzLkl6ONBQKNhQZKKGyVO+VdlWvzLPnCDKJBpJUUJqtHYgcp1WMTIkgUgz6U063F9ivhDeD
	PSFYvEMFYV16Eamv/L7Jmw26uLY9+W0s=
X-Gm-Gg: AR+sD13D+QMSDhfu+zb0lsRLEz4YWUjhSNJ7nFdt2n8X5zyS9TJppnbxGZ5yumYATgV
	tSLO0PsFwGJMEDgzp0S/vIp4SakcMga2+5DPQMR37b05rmykYGvL9Zm06URk2cGSVYr8oaIQlJu
	1ZiI+oSsr2tXI9RLF8g+HKOBiK2vzQKTGXgZMGSYb//q+NMjV6y8eS04kQ/8AuNPKCP4HB4seNJ
	/peFRMpvXB94vKT1VeDGumDXroiAQhipJsNryaPI3r/WGrGgwtx2aN7dWEhWHLjwXnmGM2SaQq7
	WHF8ZX2MO79+FL0ahLtkmX3pB6QykQIf2vUazG/hMTU9
X-Received: by 2002:a05:6214:4599:b0:907:840e:bf0d with SMTP id
 6a1803df08f44-90a91e36e9bmr328268306d6.27.1786996159958; Mon, 17 Aug 2026
 12:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu> <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
In-Reply-To: <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Tue, 18 Aug 2026 04:49:08 +0900
X-Gm-Features: AcwNN1XrCsHAjEfxqLilriIFywDTaT6tJRgLUNss1-WKXlxvXR5XJMczECy9JRE
Message-ID: <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thank you for letting me know that the earlier results were helpful.

I applied the patch as posted to upstream v7.2-rc1, commit
dc59e4fea9d83f03bad6bddf3fa2e52491777482.

I reran the original null-ptr-deref and UAF reproducers, along with the
reproducers for the earlier candidate-patch regressions. I did not observe
the corresponding KASAN signatures with this patch.

A separate cross-CPU concurrency diagnostic appears to expose a remaining
lifetime race in the deferred-read cancellation path. As I understand it,
copy_work and unlink_work are distinct work items queued through
schedule_work() and may execute concurrently on different CPUs. I did not
see an ordering mechanism in the posted patch that would serialize the two
work items. I therefore treated their concurrent execution as a possible
interleaving and modified only dummy_hcd to exercise it directly.

On dummy_hcd's successful dequeue path, the calling path released
dummy_hcd's lock and restored its IRQ state before invoking work_on_cpu().
The diagnostic ran the giveback on another online CPU and waited for it to
complete before usb_ep_dequeue() returned. GadgetFS remained exactly as in
the posted patch. The target-CPU helper disabled local IRQs around
usb_gadget_giveback_request() and restored the previous IRQ state after
the function returned. The VM used a fixed four-CPU configuration and did
not perform CPU hotplug.

With this diagnostic, the C workload repeatedly triggered:

  BUG: KASAN: slab-use-after-free in ep_unlink_worker+0x1d1/0x1f0
  Read of size 8
  drivers/usb/gadget/legacy/inode.c:488

The faulting source statement is:

  usb_ep_free_request(epdata->ep, priv->req);

I did not reproduce this UAF with unmodified dummy_hcd under the same
kernel configuration, reproducer, and arguments. Those runs completed
without KASAN or an Oops and produced one AIO completion event with
res=3D512 for each request.

The observed UAF is consistent with the following ordering.
ep_unlink_worker() calls usb_ep_dequeue(), and the giveback enters
ep_aio_complete(), sets req_state to AIO_COMPLETED, and queues
ep_user_copy_worker(). After usb_ep_dequeue() returns, the unlink worker
observes AIO_COMPLETED, sets cancel_state to AIO_UNLINK_DONE, and releases
aio_lock. The copy worker can then set req_state to AIO_GIVEN_BACK,
observe that cancel_state is no longer AIO_UNLINKING, and free priv before
the unlink worker reaches the access above.

aio_lock serializes these state changes, but it does not keep priv alive
after the unlink worker releases the lock. This suggests that the final
free must be deferred until every queued or running work item that may
access priv has finished accessing it. For example, a lifetime reference
could be taken for unlink_work before it is queued and released after
ep_unlink_worker() has finished its final access, or an equivalent
last-user mechanism could release priv only after both work items have
finished accessing it.

The reproducer does not close the GadgetFS files or trigger unbind during
the request loop, and it consumes all AIO completion events before
teardown. A workqueue flush in gadgetfs_unbind() would therefore address
teardown ordering, but it would not serialize unlink_work and copy_work
during this race.

If I have misunderstood whether the USB gadget API permits a UDC to
deliver a dequeue giveback on another CPU before usb_ep_dequeue() returns,
please let me know.

Supporting files:

  C reproducer:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260814_followup_20260817/repro_candidate_unlink=
_copy_uaf.c

  Build:
    gcc -O2 -Wall -Wextra -pthread -o repro_candidate_unlink_copy_uaf \
      repro_candidate_unlink_copy_uaf.c

  Run:
    ./repro_candidate_unlink_copy_uaf 1000 32

  Diagnostic-only dummy_hcd patch:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260814_followup_20260817/dummy_hcd_crosscpu_giv=
eback_diagnostic.patch

  Symbolized KASAN report:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260814_followup_20260817/symbolized_report_ep_u=
nlink_worker_uaf.txt

  Kernel config used for the unmodified and diagnostic runs:
    https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main=
/gadgetfs_candidate_patch_20260814_followup_20260817/kernel.config.kasan_in=
line_dwarf5_lockdep

I hope this helps.

Best regards,
Minseo Kim

2026=EB=85=84 8=EC=9B=94 15=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 1:17, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Aug 05, 2026 at 12:17:22PM -0400, Alan Stern wrote:
> > But as you have seen, there are still other problems in that driver.
> >
> > However, I'm not sure it's worth working on them.  Greg KH is talking
> > about getting rid of almost all the drivers in the gadget/legacy
> > directory.  I don't know if that will include the gadgetfs driver.  If
> > it does, trying to fix up the driver will be a waste of time.
>
> Not having heard anything from Greg, I'll assume that the driver is not
> in any imminent danger.
>
> Accordingly, below is a new patch implementing the updates mentioned
> last time.  In particular, the ep_aio_cancel() carries out its dequeue
> operation in a separate thread, and ep_aio() drops dev->lock before
> calling kiocb_set_cancel_fn() and usb_ep_queue().
>
> It will probably be necessary to flush the workqueue in
> gadgetfs_unbind() after calling destroy_ep_files(), to make sure that
> any work routines scheduled for aio requests are no longer running.  We
> can worry about that later.
>
> Alan Stern
>
>
> Index: usb-devel/drivers/usb/gadget/legacy/inode.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -236,6 +236,8 @@ static void put_ep (struct ep_data *data
>  static const char *CHIP;
>  static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock operation=
s */
>
> +static DEFINE_SPINLOCK(aio_lock);      /* Protect aio cancellation info =
*/
> +
>  /*----------------------------------------------------------------------=
*/
>
>  /* NOTE:  don't use dev_printk calls before binding to the gadget
> @@ -433,40 +435,98 @@ static long ep_ioctl(struct file *fd, un
>
>  /* ASYNCHRONOUS ENDPOINT I/O OPERATIONS (bulk/intr/iso) */
>
> +enum aio_req_state {
> +       AIO_SUBMITTING,
> +       AIO_RUNNING,
> +       AIO_COMPLETED,
> +       AIO_GIVEN_BACK,
> +};
> +
> +enum aio_cancel_state {
> +       AIO_NOT_CANCELLED,
> +       AIO_UNLINKING,
> +       AIO_UNLINK_DONE,
> +};
> +
>  struct kiocb_priv {
>         struct usb_request      *req;
>         struct ep_data          *epdata;
>         struct kiocb            *iocb;
>         struct mm_struct        *mm;
> -       struct work_struct      work;
> +       struct work_struct      copy_work;
> +       struct work_struct      unlink_work;
>         void                    *buf;
>         struct iov_iter         to;
>         const void              *to_free;
>         unsigned                actual;
> +       enum aio_req_state      req_state;
> +       enum aio_cancel_state   cancel_state;
>  };
>
> -static int ep_aio_cancel(struct kiocb *iocb)
> +static void ep_unlink_worker(struct work_struct *work)
>  {
> -       struct kiocb_priv       *priv =3D iocb->private;
> +       struct kiocb_priv       *priv;
>         struct ep_data          *epdata;
> -       int                     value;
> +       enum aio_req_state      req_state;
>
> -       local_irq_disable();
> +       priv =3D container_of(work, struct kiocb_priv, unlink_work);
>         epdata =3D priv->epdata;
> -       // spin_lock(&epdata->dev->lock);
> -       if (likely(epdata && epdata->ep && priv->req))
> -               value =3D usb_ep_dequeue (epdata->ep, priv->req);
> -       else
> -               value =3D -EINVAL;
> -       // spin_unlock(&epdata->dev->lock);
> -       local_irq_enable();
>
> -       return value;
> +       usb_ep_dequeue(epdata->ep, priv->req);
> +
> +       spin_lock_irq(&aio_lock);
> +       req_state =3D priv->req_state;
> +       priv->cancel_state =3D AIO_UNLINK_DONE;
> +       spin_unlock_irq(&aio_lock);
> +
> +       /*
> +        * priv->req and epdata are freed after unlinking and completion =
are
> +        * both done.
> +        * priv itself is freed after unlinking and giveback are both don=
e.
> +        */
> +       if (req_state >=3D AIO_COMPLETED) {
> +               usb_ep_free_request(epdata->ep, priv->req);
> +               put_ep(epdata);
> +               if (req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
> +}
> +
> +static int ep_aio_cancel(struct kiocb *iocb)
> +{
> +       struct kiocb_priv       *priv;
> +
> +       spin_lock_irq(&aio_lock);
> +       priv =3D iocb->private;
> +       if (!priv || priv->cancel_state !=3D AIO_NOT_CANCELLED) {
> +               spin_unlock_irq(&aio_lock);
> +               return -EINVAL;         /* Already completed or cancelled=
 */
> +       }
> +       if (priv->req_state =3D=3D AIO_SUBMITTING) {
> +               priv->cancel_state =3D AIO_UNLINK_DONE;
> +               spin_unlock_irq(&aio_lock);
> +               return 0;       /* ep_aio() will call us again if needed =
*/
> +       }
> +
> +       priv->cancel_state =3D AIO_UNLINKING;
> +       spin_unlock_irq(&aio_lock);
> +
> +       /*
> +        * usb_ep_dequeue() is allowed to run synchronously, calling the
> +        * request's completion handler before it returns.
> +        * We are called with the aio core holding the aio's context lock=
,
> +        * and ep_aio_complete() below may call iocb->kio_complete(), whi=
ch
> +        * tries to acquire the context lock, which would cause deadlock.
> +        * For this reason, do the dequeue operation in a work routine.
> +        */
> +       INIT_WORK(&priv->unlink_work, ep_unlink_worker);
> +       schedule_work(&priv->unlink_work);
> +       return 0;
>  }
>
>  static void ep_user_copy_worker(struct work_struct *work)
>  {
> -       struct kiocb_priv *priv =3D container_of(work, struct kiocb_priv,=
 work);
> +       struct kiocb_priv *priv =3D container_of(work, struct kiocb_priv,=
 copy_work);
>         struct mm_struct *mm =3D priv->mm;
>         struct kiocb *iocb =3D priv->iocb;
>         size_t ret;
> @@ -482,7 +542,12 @@ static void ep_user_copy_worker(struct w
>
>         kfree(priv->buf);
>         kfree(priv->to_free);
> -       kfree(priv);
> +
> +       spin_lock_irq(&aio_lock);
> +       priv->req_state =3D AIO_GIVEN_BACK;
> +       if (priv->cancel_state !=3D AIO_UNLINKING)
> +               kfree(priv);
> +       spin_unlock_irq(&aio_lock);
>  }
>
>  static void ep_aio_complete(struct usb_ep *ep, struct usb_request *req)
> @@ -490,11 +555,13 @@ static void ep_aio_complete(struct usb_e
>         struct kiocb            *iocb =3D req->context;
>         struct kiocb_priv       *priv =3D iocb->private;
>         struct ep_data          *epdata =3D priv->epdata;
> +       enum aio_req_state      new_req_state;
> +       enum aio_cancel_state   cancel_state;
>
> -       /* lock against disconnect (and ideally, cancel) */
> -       spin_lock(&epdata->dev->lock);
> -       priv->req =3D NULL;
> -       priv->epdata =3D NULL;
> +       /* Prevent future cancellation */
> +       spin_lock(&aio_lock);
> +       iocb->private =3D NULL;
> +       spin_unlock(&aio_lock);
>
>         /* if this was a write or a read returning no data then we
>          * don't need to copy anything to userspace, so we can
> @@ -503,10 +570,9 @@ static void ep_aio_complete(struct usb_e
>         if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) =
{
>                 kfree(req->buf);
>                 kfree(priv->to_free);
> -               kfree(priv);
> -               iocb->private =3D NULL;
>                 iocb->ki_complete(iocb,
>                                 req->actual ? req->actual : (long)req->st=
atus);
> +               new_req_state =3D AIO_GIVEN_BACK;
>         } else {
>                 /* ep_copy_to_user() won't report both; we hide some faul=
ts */
>                 if (unlikely(0 !=3D req->status))
> @@ -515,13 +581,24 @@ static void ep_aio_complete(struct usb_e
>
>                 priv->buf =3D req->buf;
>                 priv->actual =3D req->actual;
> -               INIT_WORK(&priv->work, ep_user_copy_worker);
> -               schedule_work(&priv->work);
> +               new_req_state =3D AIO_COMPLETED;
>         }
>
> -       usb_ep_free_request(ep, req);
> -       spin_unlock(&epdata->dev->lock);
> -       put_ep(epdata);
> +       spin_lock(&aio_lock);
> +       priv->req_state =3D new_req_state;
> +       cancel_state =3D priv->cancel_state;
> +       spin_unlock(&aio_lock);
> +
> +       if (new_req_state =3D=3D AIO_COMPLETED) {
> +               INIT_WORK(&priv->copy_work, ep_user_copy_worker);
> +               schedule_work(&priv->copy_work);
> +       }
> +       if (cancel_state !=3D AIO_UNLINKING) {
> +               usb_ep_free_request(ep, req);
> +               put_ep(epdata);
> +               if (new_req_state =3D=3D AIO_GIVEN_BACK)
> +                       kfree(priv);
> +       }
>  }
>
>  static ssize_t ep_aio(struct kiocb *iocb,
> @@ -532,11 +609,12 @@ static ssize_t ep_aio(struct kiocb *iocb
>  {
>         struct usb_request *req;
>         ssize_t value;
> +       struct usb_ep *ep;
> +       bool need_unlink =3D false;
>
>         iocb->private =3D priv;
>         priv->iocb =3D iocb;
>
> -       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
>         get_ep(epdata);
>         priv->epdata =3D epdata;
>         priv->actual =3D 0;
> @@ -547,10 +625,11 @@ static ssize_t ep_aio(struct kiocb *iocb
>          */
>         spin_lock_irq(&epdata->dev->lock);
>         value =3D -ENODEV;
> -       if (unlikely(epdata->ep =3D=3D NULL))
> +       ep =3D epdata->ep;
> +       if (unlikely(ep =3D=3D NULL))
>                 goto fail;
>
> -       req =3D usb_ep_alloc_request(epdata->ep, GFP_ATOMIC);
> +       req =3D usb_ep_alloc_request(ep, GFP_ATOMIC);
>         value =3D -ENOMEM;
>         if (unlikely(!req))
>                 goto fail;
> @@ -560,12 +639,45 @@ static ssize_t ep_aio(struct kiocb *iocb
>         req->length =3D len;
>         req->complete =3D ep_aio_complete;
>         req->context =3D iocb;
> -       value =3D usb_ep_queue(epdata->ep, req, GFP_ATOMIC);
> +
> +       priv->req_state =3D AIO_SUBMITTING;
> +       priv->cancel_state =3D AIO_NOT_CANCELLED;
> +
> +       /* Not allowed to manipulate the aio context while holding dev->l=
ock */
> +       ++epdata->dev->udc_usage;
> +       spin_unlock_irq(&epdata->dev->lock);
> +
> +       kiocb_set_cancel_fn(iocb, ep_aio_cancel);
> +       value =3D usb_ep_queue(ep, req, GFP_KERNEL);
> +
> +       spin_lock_irq(&epdata->dev->lock);
> +       --epdata->dev->udc_usage;
> +
>         if (unlikely(0 !=3D value)) {
> -               usb_ep_free_request(epdata->ep, req);
> +               spin_lock(&aio_lock);
> +               iocb->private =3D NULL;
> +               spin_unlock(&aio_lock);
> +
> +               usb_ep_free_request(ep, req);
>                 goto fail;
>         }
>         spin_unlock_irq(&epdata->dev->lock);
> +
> +       spin_lock_irq(&aio_lock);
> +       if (iocb->private !=3D NULL) {
> +               priv->req_state =3D AIO_RUNNING;
> +
> +               /* Cancelled before or just after submission? */
> +               if (priv->cancel_state =3D=3D AIO_UNLINK_DONE) {
> +                       priv->cancel_state =3D AIO_NOT_CANCELLED;
> +                       need_unlink =3D true;
> +               }
> +       }                       /* Otherwise already completed */
> +       spin_unlock_irq(&aio_lock);
> +
> +       if (need_unlink)        /* Redo cancel that was too early */
> +               ep_aio_cancel(iocb);
> +
>         return -EIOCBQUEUED;
>
>  fail:
>
