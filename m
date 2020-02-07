Return-Path: <SRS0=ig6G=33=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A888C352A2
	for <linux-usb@archiver.kernel.org>; Fri,  7 Feb 2020 08:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 457A5217BA
	for <linux-usb@archiver.kernel.org>; Fri,  7 Feb 2020 08:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgBGIw0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 7 Feb 2020 03:52:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:58318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbgBGIw0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Feb 2020 03:52:26 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 206435] dwc3 dwc3.3.auto: no usb2 phy configured
Date:   Fri, 07 Feb 2020 08:52:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexandre.torgue@st.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206435-208809-XkAueHRXbB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206435-208809@https.bugzilla.kernel.org/>
References: <bug-206435-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206435

--- Comment #7 from alexandre.torgue@st.com ---
Hi Felipe,

On 2/6/20 7:33 PM, Felipe Balbi wrote:
> 
> + Heikki, since this is, apparently, Bay Trail
> 
> Felipe Balbi <balbi@kernel.org> writes:
> 
>> Hi,
>>
>> bugzilla-daemon@bugzilla.kernel.org writes:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=206435
>>>
>>> --- Comment #3 from youling257@gmail.com ---
>>> Revert 987351e1ea7772cf2f0795e917fb33b2e282e1c1 phy: core: Add consumer
>>> device
>>> link support, dwc3 work for my z3735f device.
>>>
>>> android_x86:/ $ su
>>> android_x86:/ # dmesg | grep dwc
>>> [    9.724606] dwc3 dwc3.3.auto: changing max_speed on rev 5533210a
>>> [   47.488501] udc dwc3.3.auto: registering UDC driver [g1]
>>
>> reverting that commit makes dwc3 work? Then you don't have a bug on
>> dwc3. You have a regression caused by another commit.
>>
>> Alexandre, any idea what's going on?
> 

It's probably due to error returned by "device_link-add" function called 
in phy-get (phy-core.c). Maybe because phy dev is not present. I wonder 
if we should update device_link_add error management in phy-get (if link 
add fails it's maybe not a reason to make the consumer probe fail)

regards
Alex

> Heikki, any ideas?
>

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
