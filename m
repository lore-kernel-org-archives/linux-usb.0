Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84761C10F03
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 16:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5345E20811
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 16:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727737AbfDWQMq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 12:12:46 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:51854 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726655AbfDWQMq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Apr 2019 12:12:46 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3NG9oEd014513;
        Tue, 23 Apr 2019 11:12:36 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2ryyukmd2k-1;
        Tue, 23 Apr 2019 11:12:35 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail3.cirrus.com (Postfix) with ESMTP id 2A3D46255C4A;
        Tue, 23 Apr 2019 11:13:07 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 23 Apr
 2019 17:12:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 23 Apr 2019 17:12:34 +0100
Received: from londnb751274.ad.cirrus.com (unknown [198.90.238.37])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CBCA144;
        Tue, 23 Apr 2019 17:12:34 +0100 (BST)
Message-ID: <1556035954.6050.1.camel@opensource.cirrus.com>
Subject: Re: Query on usb/core/devio.c
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>
Date:   Tue, 23 Apr 2019 17:12:34 +0100
In-Reply-To: <Pine.LNX.4.44L0.1904011620370.1506-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1904011620370.1506-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904230110
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-04-01 at 16:22 -0400, Alan Stern wrote:
> Mayuresh:
> 
> Whatever happened to this discussion?  Did you reach a decision on 
> whether the proposed API addition would suit your needs?
> 
> Alan Stern

Hi Alan,

Apologies for not being able to respond to this email thread before.
Around mid-Dec of 2018, I got allocated to some other completely different
project for couple of months.

Just at the of start of Apr 2019, I am back to the USB-audio project and this
discussion.
So almost perfect timing for your nudge.

I am in process of setting up my environment and should have some result at-
most 
by early next week. I am attempting to verify the use-case of suspend/resume
with: host wake and remote wake.

Thanks again for your nudge.

> 
> 
> On Tue, 20 Nov 2018, Mayuresh Kulkarni wrote:
> 
> > 
> > On Fri, 2018-11-16 at 11:08 -0500, Alan Stern wrote:
> > > 
> > > On Fri, 16 Nov 2018, Mayuresh Kulkarni wrote:
> > > 
> > > > 
> > > > 
> > > > Thanks for the comments. Based on the info so far, attempting to
> > > > summarize
> > > > the
> > > > probable solution, to ensure that I understand it clearly -
> > > > 
> > > > Facts -
> > > > 1. USBFS driver grabs a PM ref-count in .open and drops it in .close
> > > > which
> > > > means
> > > > USB device cannot suspend untill user-space closes it (even if all
> > > > interface
> > > > drivers report "idle" to usb-core).
> > > > 2. Since the .ioctl "knows" that .open has ensured to keep device
> > > > active, it
> > > > does not call PM runtime APIs.
> > > > 
> > > > Proposal -
> > > > 1. Add new ioctl: suspend & wait-for-resume
> > > > 2. suspend ioctl: decrements PM ref count and return
> > > > 3. wait-for-resume ioctl: wait for resume or timeout or signal
> > > Do you really want to have a timeout for this ioctl?  Maybe it isn't 
> > > important -- I don't know.
> > > 
> > Agreed, the timeout probably is not needed in this proposal.
> > 
> > > 
> > > > 
> > > > 
> > > > 4. Modify .ioctl implementation to do PM runtime calls except for above
> > > > "new"
> > > > ioctl calls (so pm_runtime_get_sync -> ioctl -> response ->
> > > > pm_runtime_put_sync). This also means, pm runtime get/put will be in
> > > > both
> > > > .open/.close.
> > > That's not exactly what I had in mind.  Open will do:
> > > 
> > > 	ps->runtime_active = true;
> > > 
> > > The new suspend ioctl will do this:
> > > 
> > > 	if (ps->runtime_active) {
> > > 		usb_autosuspend_device(ps->dev);
> > > 		ps->runtime_active = false;
> > > 	}
> > > 
> > > and the old ioctls (and close) will do this at the start:
> > > 
> > > 	if (!ps->runtime_active) {
> > > 		if (usb_autoresume_device(ps->dev))
> > > 			return -EIO;	/* Could not resume */
> > > 		ps->runtime_active = true;
> > > 	}		
> > > 
> > > This means that after any interaction with the device, you will have to 
> > > call the suspend ioctl again if you want the device to go back to 
> > > sleep.
> > > 
> > Thanks, looks good.
> > 
> > > 
> > > > 
> > > > 
> > > > Use-case analysis -
> > > > 1. Remote-wake: Due to device's remote wake, wait-for-resume will return
> > > > successfully. The user space caller then need to queue a request to
> > > > "know"
> > > > the
> > > > reason of remote-wake.
> > > > 2. Host-wake: The user-space caller issues any ioctl supported by .ioctl
> > > > method.
> > > > Due to (4) above, the device will be resumed and the ioctl will be
> > > > performed.
> > > Correct.
> > > 
> > > > 
> > > > 
> > > > For (2) in use-case analysis, the user-space caller's wait-for-resume
> > > > will
> > > > also
> > > > return, but since it knows that it has initiated the ioctl, it may or
> > > > may
> > > > not
> > > > decide to queue a request. Instead, when ioctl returns it can call wait-
> > > > for-
> > > > resume again.
> > > Yes.  Of course, your app will have some way to check for user
> > > interaction with the device.  Doing these checks while the device is
> > > suspended would be counter-productive, since the check itself would
> > > wake up the device.  So you will probably want to do a check as soon as
> > > you know the device has woken up, regardless of the cause.  If you 
> > > don't, you run the risk of not noticing a user interaction.
> > > 
> > > > 
> > > > 
> > > > Am I getting in sync with your comments?
> > > > 
> > > > What issue(s) you anticipate in above proposal due to inherent race
> > > > condition
> > > > between host and remote-wake?
> > > Only what I mentioned above, that your program should check for user 
> > > interaction whenever it knows the device has woken up.
> > > 
> > Thanks, looks good.
> > 
> > > 
> > > > 
> > > > 
> > > > Based on my meagre understanding of usb-core, it feels
> > > > like usb_lock_device/usb_unlock_device calls around remote-wake and
> > > > usbfs
> > > > ioctl
> > > > should help with race condition, right?
> > > No, they will not help.  This is not a race between two different parts
> > > of the kernel both trying to communicate with the device; it is a race
> > > between the kernel and the user.  usb_lock_device doesn't prevent the 
> > > user from interacting with the device.  :-)
> > > 
> > > Alan Stern
> > I will go back and review this proposal internally. Possibly also attempt to
> > implement a quick version of it and see how it behaves. Will keep this email
> > thread posted with relevant updates.
> > 
> > Thanks Alan and Oliver for the all inputs and comments so far.
