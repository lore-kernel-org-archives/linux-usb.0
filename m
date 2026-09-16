Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734F3A4523
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 02:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526240; cv=none; b=U6PutujJVzL6k9Ih5K+PSW5LFcS5TWDKTMIEH3BEAiHUmhtzGUJKAoki3NYuWofDreIanw1rCugysZLiP8/7GIrz9DXiKZJI3jUq0fs6yAh7Ol8g+AVNyRPgScf3VHwdtZK3ZMB8agaNm4WlfvskJFihW7PCLPm2BKO4MHLRgkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526240; c=relaxed/simple;
	bh=xkljPc6Y0YECh/IDBYyD2J4WT/DUhenuiP7yTVB0YvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5s1Hox/QnqEf31/s8EsQ8oBPsVKiVn6DdulphIX3uBdwtDICmbVhctZZGwJHnkvGKijjCJGBbPy3neAAjECvuCP/Z733d70M+s1tjehTrL3qWBokf9/qsPZ6vrrcc7tYu070dRMqPG96AnxVgoZTcurqEdcCii9Xk/SM3FJ8BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Fe4UiRpT; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Fe4UiRpT"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe60d5fso4248796d6.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 19:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789526235; x=1790131035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXlzl1Zcy5r64Gi2wYyC9ird0XfTXhgNyijd3728e3U=;
        b=Fe4UiRpTf94w4GzaO9Y/eJZn3BdKMNAjqT6SPboZWgUhfjAi/rDJYHya/d7WXoVNFe
         ZOGm5s32qDYuVsUuI6mcywt/bFhK84b+5jW7TfYBFBLCdLWM8xzNem8CrfVeZkk8zh2x
         WmztfRODQdtrraYFGsBWs2mRg9wiR6Shmo090YTAoZLAcek3HvlNtKEmIssG+pnQX2BO
         AFrNsh6kv8pLO/8H7Acr18bRTT2+xz6gADFDMl6oFwj3mZZ+DGieyQn8mq1en/erMA4q
         LqTMuRWdj5pafu0qcDpOnF8DG94QfFYOSyFBQrRwd8YtxOZq+oEjysv2Kbp9fx5091AM
         K/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789526235; x=1790131035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXlzl1Zcy5r64Gi2wYyC9ird0XfTXhgNyijd3728e3U=;
        b=QGsYTHWnmYRjInRFx7Lv4eXLiXJVHMNQGw1OoJ4RDNAj2O4jc3kwrLZhaHq84f+Y2G
         n8jVj04Gz2pfn5S81CqrvWFC/JOKppJx8ao2V8lFdDAywXhTZ9w7zJqakfvlqDywAqad
         b3QhVfXMJuliFs5woB46rECMO9jpPnmr5XvQq8dhfzZpar4ykOrYI4lnq9avrietHSzS
         Biw1nu9hWcJIsiV0DvS/kmdSmNxKMD0smgUEo2PG+j+EzU2OzgqspdSqnbVy0HCHa+km
         fAXZ2hTXmjG0jK6LIwmbOJW10pXriKArc8lOVxh2HOG8o4AVA8qCTwqSRueaHIEG88AQ
         cIJQ==
X-Gm-Message-State: AFuF++lK6sqRbymcDRrnREG/M4tE6z6iGac5zEekv2hPjijc+idMm0Vs
	axcmvYfMLoAh5CcqcZKs2ZoTKQhhoRJ2oet9kAPr237JjqgZd3zUfZNRpCpw9ctoVttv7dlaUEU
	uWsynRA==
X-Gm-Gg: AYBFou1vpSy3XU0v5SYxWj9oKch8MQqE22t3V0y8STutwQTbzarhtNZtdSk2fs70hWW
	fOkEeVGK0wYpT2e5lk3XvL+eKoRb0DiBgI80FTTQo8CXsZSuMcLq8pKBB9A8vkUSebinuoXBpiW
	50gdKhYmJZAxjEk0m2Zgh0gr9eIuOAGcmMzs2X/nPfKXOGpD1DZ0l4IJ+vrBjiU8pMjd4hFj7oS
	UlgAdrZrOWS/FenB0SJpf5C1W/0PrOstk4mbQNCcC3+OU8PkF2aNGHxoaIQpDIB3MehvT6qP7Xs
	S3Oc3ZUNOE9wCuTZtRi1lmvJDbeeWb2+t1TVV5LXvo94jNB4dg41t2FYnwqjitpjKRW5cSKEFUc
	zVFEpE8BBx/94g6u1widjFXfo8dU8ErVtEE9f+l8qoVnq9fzr5s5g9gqtQ5lHFNwCHmr8pLnRoF
	6HTmQRsHP30kQ1alkwqT3UWMOjiwvFeObIZx8HBx88Fl5dtHONOqVinJtBIb1KcXoeUp+a6v40
X-Received: by 2002:a05:6214:3285:b0:912:bed:c74 with SMTP id 6a1803df08f44-9123d7bbd72mr15498306d6.30.1789526235129;
        Tue, 15 Sep 2026 19:37:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be63bdfsm14376446d6.17.2026.09.15.19.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:37:14 -0700 (PDT)
Date: Tue, 15 Sep 2026 22:37:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Fabien Sanglard <sanglardf@google.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: Missing uevents after successful USBDEVFS_RESET
Message-ID: <a0934cb4-82f2-42bf-abd8-95a0016fb0e4@rowland.harvard.edu>
References: <CAA92w6k-LA4tVXyX1mFNOR3e+_mC43F_BXqhXeWqQyFx2D4_Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA92w6k-LA4tVXyX1mFNOR3e+_mC43F_BXqhXeWqQyFx2D4_Mg@mail.gmail.com>

On Tue, Sep 15, 2026 at 02:48:08PM -0700, Fabien Sanglard wrote:
> Hi,
> 
> I am investigating an issue where userspace processes using usbfs (such as
> ADB) cannot reliably track device state across a USBDEVFS_RESET ioctl by
> monitoring netlink uevents.
> 
> Repro steps: (Lenovo P620, kernel 7.1.6)
> 1. Plug an ADB device into your computer.
> 2. Open a console to monitor netlink events: udevadm monitor -p -u.
> 3. Send USBDEVFS_RESET a couple of times (i used adb_usbreset).
> 4. 50% of the time the event sequence is UNBIND/REMOVE/ADD/BIND. 50%
> of the time, the event sequence is just UNBIND.
> 
> When USBDEVFS_RESET is issued via drivers/usb/core/devio.c, it calls
> usb_reset_device() -> usb_reset_and_verify_device() in drivers/usb/core/hub.c.
> Depending on the reset outcome, userspace sees inconsistent uevents:
> 
> Case 1: Full re-enumeration (descriptors changed or reset/verify failed)
> The device is torn down and reprobed. Userspace receives:
>   UNBIND -> REMOVE -> ADD -> BIND
> Userspace processes monitoring uevents immediately detect that the device
> is available again and re-open it.
> 
> Case 2: Reset succeeds without re-enumeration (descriptors unchanged)
> The kernel unbinds usbfs/interface drivers before reset, generating a
> KOBJ_UNBIND uevent. Because the usb_device structure is preserved and
> usbfs does not re-probe, no subsequent KOBJ_BIND, KOBJ_ADD, or KOBJ_CHANGE
> event is ever emitted.
> 
> As a result of Case 2, userspace receives an UNBIND ("disconnect") signal
> and assumes the device went away, but never receives an event indicating
> that the reset finished and the device is ready for reuse. This forces
> daemons like adb to fall back to polling /dev/bus/usb instead of relying
> on netlink/udev events.
> 
> Is the omission of a completion uevent after a successful reset without
> re-enumeration intentional?

It's more or less unintentional.

A normal driver would rebind automatically.  But usbfs isn't normal, in 
the sense that it won't bind to a device without a special user request 
(primarily the USBDEVFS_CLAIMINTERFACE ioctl but also some others).

> If not, would a patch emitting KOBJ_CHANGE (or re-binding/notifying userspace)
> upon completion of usb_reset_device() be acceptable here?

Yes.  But there are some things to bear in mind:

Adding pre_reset and post_reset handlers to the usbfs driver would 
prevent unbinding in case 2.  The problem is that there is no 
agreed-upon way to then let userspace clients know that the device has 
been reset, or to let them know beforehand that the device is going to 
be reset.  In other words, the two handlers wouldn't be able to do 
anything useful.

Emitting a KOBJ_CHANGE uevent instead would be more straightforward.  
But you would have to think carefully about the conditions under which 
it should be sent.

Alan Stern
