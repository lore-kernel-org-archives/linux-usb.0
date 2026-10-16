Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D83AEF5A
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132342; cv=none; b=c1hKj/mSvjf5bfAygJyLuDWSyuF6V5SRd4rnAyZGerEbf65ZYNg7+PrlIkCE1vwckzxjvkpzb0p5TSwZQcVliYcquaMXyrvllTEPSwJzsNzONSsTm9Uag5ATcCW831Zw7oCS1KmrGw1kRA2n7GuyhLnl8Khx3MVmrZ37gUua0ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132342; c=relaxed/simple;
	bh=zDe/lQLR6Ws6mpn4nYw7XIrByoNV/f3obmDPa6nEUhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F/+MJ/N4hrnbhSEQOsladhZAP1v5jRr6grDVfuh92ZEHTdjwJkPHmUK5y0v654VX/U+42TnRFW2AAKY8K9hZ+0Icuk2aOrGXAW4RBi2OXqqGgQDK3446AXaXdeOJGGSb3i3skBFy6KaMoAM8hmsHI0NiZcI92eYpMWzlSxPnuRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95bd1c14cso14655825ad.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 23:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132339; x=1792737139;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3s24oXkKtYZo2IpW0N7lHNROKWZCCGTjiKLfIvu3YM=;
        b=0VajfG+MePmlCO/QknHi7b3+dixdLp3DCJCz4lymlYPr1QHfhNlUDA8Oj2inaPjDFS
         JQiPgiAFcpRKVCFztuKH/rquPSsBP8CqDn+gAfL9zYpGGam6NUSbt3YUKMBc3gUgBKet
         0nhvPDpS2Kr3eaArvYjVZd5Tz+Qion5FsCh3TA5UIezn35rO61qoBMd79cm9L7X370tW
         Zamhp/Ngxg+hqlPxlDgkXDU3GjXHCnI+K3z8CO/uytGQX5ChzsRuAutJVrrk/Vt3M8en
         bkvFFPdUE10bAS33E/lSSXq96rp9DA7E06cEitSNqgnINDYvaQ/hMRV03+9UxdFKcvZ8
         2uBg==
X-Forwarded-Encrypted: i=1; AKwUvBy/MqCbt9L+YQ+fG2EvHGoHHem5KcHfOgdomeu3fjsQvnuRAj7IToVWdMvVdp5U4raUKrvd+h6TtF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9TWAKsWrMZd3CfuQ5NUVp8wQZHXRshzD+XG41Ah1IAuR6ame4
	P6hVZUvaU8+Jxp+R2nMAEvdFoTKS8+vJEpHTBof+e0dHmqnvPJ67cWmILHnMaIQV
X-Gm-Gg: AYBFou3vxeEFJEZlkmwO06MTetb1S/SnTEkfCfLfEVbDdcZIT22FKcU31dn7bdzTwu7
	UrzSnG2HSeD6xeLBjnGNFq6FM4zOenMnmjMJo8AMTN8xl15ajlQgvl6n/si7XH2NMQjT0a8KwCn
	yVYrfkvznvr9wMt6DPe5p3S4+//MKEviyzX7NdLu4dPXiJn0Zi9uC8ueTOqwpy1gFqe0nnSKQkS
	uURPlh07d9Ol08C3AFk/TqtfCL11712zEzw9u1pmiin61x/6R2O2R/s/W6AgJU8i/0yHViF0IIz
	oQQqzf+6EJsrI6c2AP6RMNYiXqjWrlXG3miAA4zXaoWbLoJHYhaHHJwpM1QVgYUcrsv32WrPbXh
	aQ0eDkFqiaBktTEiWIfcGzvoVUeU4mBFF6Xrh4c9NS+B2sp5aDhmNkB4Wzy9a2AG2Y9JD9RGMxQ
	k//wLxR2xYeS5hAJoYNnB5hZYtuY4R6+RuPRq6aTAzshxWuzp3F4VqwwPGvnR+2zh4iFbRfG9vm
	StZ5y2S3Q8+oH1AeDLbCS1zJAY0NzAuZZLoZ1kYJ9J8oA7NDjv52go115UQApyG7WDaN6xEenrU
	EZWsmK3uoK7SNEM=
X-Received: by 2002:a17:902:ecd1:b0:2e5:a355:56d8 with SMTP id d9443c01a7336-2e842e1555dmr191380455ad.42.1792132338881;
        Thu, 15 Oct 2026 23:32:18 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.247.110.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804bfbsm5106615ad.28.2026.10.15.23.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:32:18 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
Subject:
 Re: [usb-storage] [PATCH] usb: storage: bound timeout=0 URB waits to 30s
Date: Fri, 16 Oct 2026 14:32:14 +0800
Message-ID: <179213233444.78616.16846009709382132836@kylinos.cn>
In-Reply-To: <c1a82ee2-c48a-44ca-9da7-d3bad26dc240@rowland.harvard.edu>
References: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
 <c1a82ee2-c48a-44ca-9da7-d3bad26dc240@rowland.harvard.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Alan,

[Q2 first, then Q1, Q3, then the direction. One scope update before
those, because it changes how the motivation should be read.]

Scope update: upstream has already dealt with the specific device
class behind our incident, by removing it from usb-storage entirely.
Commit a3dc32c635ba ("USB: storage: Ignore driver CD mode for Realtek
multi-mode Wi-Fi dongles", v6.17) unconditionally ignores 0bda:1a2b and
0bda:a192 (US_FL_IGNORE_DEVICE) -- your Acked-by is on it. We confirmed
on 6.17+ kernels that these devices now log "device ignored" and never
create sr0; our incidents were on a 5.4-based kernel, which predates
that commit, and the modeswitch itself goes through libusb and never
needed sr0. So this patch should not be read as being about that one
adapter anymore. What the incident exposed, and what the patch is
actually about, is the generic gap any usb-storage device still has:
msg_common() called with timeout == 0 waits with MAX_SCHEDULE_TIMEOUT,
i.e. with no bound at all.

A second honesty update, because you asked exactly the right questions
and the answers differ per sample: we have since dissected a kdump from
an October incident on the same fleet, and it is a different failure
shape from the September ones. In the October dump the TEST UNIT READY
never reached the LLDD at all -- it was stranded on the block layer's
per-hardware-queue dispatch list (blk-mq, 5.4-based): the request was
never started, so its SCSI timeout was never armed, the error handler
never engaged, and msg_common() was never entered with that command.
That shape is a 5.4 block-layer bug; mainline has since reworked the
dispatch tail (e.g. 6d5e8d21e899 "blk-mq: remove unneeded needs_restart
check" and the surrounding rework) and no longer carries the logic
involved. The patch below does not address that shape and I am not
claiming it does. Everything below describes the September shape,
where the command did reach the transport.

On Wed, 14 Oct 2026, Alan Stern wrote:
> > A device that stops responding while such a transfer is pending hangs the
> > control thread permanently,
>
> Why do you say it hangs _permanently_?  I've seen plenty of examples
> where the hang ended when the transfer was aborted.

You are right for the healthy-host-controller case, and our own tests
agree with you: when the HC is healthy, the abort path does end the
hang (details under Q3). "Permanently" holds only when the hang closes
into the cycle below -- and then it holds until power loss. In the
September incidents (5.4-based arm64), one machine sat wedged from
23:38 until it was power-cycled three and a half days later; hung_task
warned every 120 s throughout and nothing ever unwedged it.

The cycle, in the September samples' stack shape:

    mdadm (systemd shutdown hook runs `mdadm --wait-clean --scan`,
    which opens every block device): D state in disk_block_events ->
    cancel_delayed_work_sync, holding ev->block_mutex    [hung_task x10]
      events workfn: TEST_UNIT_READY never finishes
      TUR's 30s SCSI deadline fires -> EH -> command_abort():
      unbounded wait_for_completion(&us->notify)
      control thread: msg_common(timeout=0) ->
      wait_for_completion_interruptible_timeout(MAX_SCHEDULE_TIMEOUT)
      [TASK_KILLABLE -- invisible to hung_task, hence only mdadm shows]

Note the last line: hung_task only reports the UNINTERRUPTIBLE part of
the cycle, which is why the logs look like "mdadm hung" when the
usb-storage control thread is equally stuck. Unplugging the stick does
not deadlock the box (no block device open, no disk_block_events); the
mdadm hook is what turns a usb-storage wedge into a system deadlock.

> >       -> usb_stor_stop_transport()  /* URB unlink issued, but the URB of
> >                                       a device wedged mid-transition
> >                                       never completes */
>
> Why do you say the URB never completes?  Unlinking an URB should always
> cause it to complete, whether the device is responding or not.

I will drop that wording. What I can stand behind is the endpoint
fact, not the mechanism: in those incidents the device never
disconnected -- the firmware was wedged mid-modeswitch, still attached,
bulk endpoint silent, and there are zero USB disconnects in the logs
across the whole window. With no disconnect,
usb_disable_device() -> usb_hcd_flush_endpoint(), the path that
forcibly completes pending URBs, never runs. command_abort() did run
and did issue usb_unlink_urb() via usb_stor_stop_transport(). The
control thread still never returned from the msg_common() wait until
power-off days later. Why the host controller did not hand the
unlinked URB back in that exact state, I cannot explain -- we never
reproduced that state live to dissect it. On healthy host controllers,
unlink and kill do complete, including against a dead device; our own
A/B tests show exactly that (below).

> Then the appropriate fix is to add a suitable timeout at the appropriate
> point in this cycle.  Not to force every command to be limited to a
> pre-defined 30-second timeout.

Agreed on both halves. On the first: in this cycle, that point is
msg_common(). Of the four waits in the cycle: the mdadm
cancel_delayed_work_sync() is block-layer code that cannot be safely
timed out (work would leak); the TUR deadline already exists and had
already fired -- that is how the EH got involved; the notify wait is
contract-protected (under Q3); and the msg_common timeout=0 waits are
the only ones that can be safely bounded. Upstream base already
handles a timeout there: the "timeleft <= 0 -> usb_kill_urb()" block
is existing code, so the patch adds no new kill semantics -- it only
replaces MAX_SCHEDULE_TIMEOUT with a finite value.

On the second half (and Oliver's reply reaches the same conclusion):
a v2 would impose no uniform timeout. While a SCSI command owns the
transport, the URB waits would be bounded by that command's own SCSI
deadline:

    timeout ? : (READ_ONCE(us->srb) ?
                 scsi_cmd_to_rq(us->srb)->timeout : USB_STOR_URB_TIMEOUT)

No command would be limited below -- or beyond -- what the SCSI layer
already grants it. The flat fallback would remain only for the
command-less internal transfers (the probe-time CBW/CSW/CBI exchanges
and similar), which today have no deadline of any kind. In the
September incidents the offending command was an events-poll TUR with
a 30s deadline, so behavior there is identical either way.

> Again, why doesn't the scsi error handler procedure unwedge the thread?

Because the per-host EH thread parks in the unbounded notify wait
before any rung that could reset something can run:

  - eh_abort_handler = command_abort(): ends in
    wait_for_completion(&us->notify), no timeout;
  - eh_device_reset_handler = device_reset(): it starts by aborting
    all commands for the host, which reaches the same unbounded wait
    before any reset is issued;
  - eh_bus_reset_handler = bus_reset(): never reached while the EH
    thread is parked in the first wait;
  - there is no eh_host_reset_handler, so the ladder has no terminal
    rung (eh_deadle is correspondingly unused).

And the notify wait is a serialization contract, not an oversight: on
TIMED_OUT the control thread tail does complete(&us->notify), sets
us->srb = NULL and skips scsi_done -- finalization ownership moves to
the EH. Timing that wait out would let the EH finalize/requeue the
scmd while the control thread is still executing it (us->srb
double-finalize race). We analyzed exactly that and rejected it.

Evidence available on request: the two September production incidents
with identical stacks (5.4-based arm64) plus a third fresh-boot
sample; sysrq-t full-task dumps; the October kdump behind the scope
update above; A/B tests on real hardware -- with the bound, an induced
wedged device recovers automatically (URB kill returns in ~ms, full EH
recovery ~34 s, 990+ hibernate cycles without recurrence); without it,
the same wedge on a healthy host controller is recovered by the EH.
The bound exists for the state where it is not.

If the per-command-deadline direction works for you (and Oliver), I
will prepare v2 in that form.

Thanks,
Hongyu Xie
