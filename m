Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CF33EAEC
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222084; cv=none; b=JR/7gi0+D51uD8eVu/0kpCiYqPltcmWcbRUr1VxPVbuFzRMnQo31plE0HIZ1JJiiR9AKrgOfZ+94z3dzQ43w+Xs+CNzNpoUTeU2Nh3oWq+NAXtITCgLdpOvR3n9a5teykB2WqmMrHjuRyRfwafJFV4rL59f8lyoUdaDYuLfUd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222084; c=relaxed/simple;
	bh=N5pN1DI1Bpg+NRDQIZl0zY7ixBv/obs7rvlGbXuLJdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGG3kCz/ETxJBEZtPIGeZcJR7NWeDpRyH1uuf8OVBZacb9zJwcOZ0X9qsEcg2oRxD0TiCsatFj/T4t7/piQkbo3gKCWDTKv7a9BeJ3unbi4rdilTLq4MIDwl26UWalm1e4uoW6aRfwpwod4sa6ZQ+5wIdUpf3aF7QyTKLGxl12o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OL9K6/57; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OL9K6/57"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93a0fd41a7bso14521185a.1
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222081; x=1789826881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UTCfdkP73gLXJ25CwDT//d6Us1e6esblg46ABiyVDOM=;
        b=OL9K6/57FIfCiT+NwWQ6zY2Rf+odEE1e+8iauB/eF1iL6JPqlnYHxbF2XVVBMrnWZg
         PshKvIB5uuBojMfXqQOyEYX8JQ0s73caJ904v/Ob81w6pRCiv+/mQVT3u4viq7R5urbW
         Lnpe5C7MeBvEeVFv+jmxEhfnTjVwmAhWNGKKILQSLM62pQFWq28tmFDzKBWJe2+aXoFP
         JWoKNKf19P2A50q6FCmbP38y7w3V2dn+dvLMhsbwKAcGQUELWoF0ZER1d5kuALUJpnsf
         eu6gfljlCmU/jSMn9Hvxh67ZZ/01TWIRLdm1oLDCghkyvsmQ3oUqbzaOopeVAkNOV88D
         saPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222081; x=1789826881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTCfdkP73gLXJ25CwDT//d6Us1e6esblg46ABiyVDOM=;
        b=c8m0kEjQkZnANS+tqEEZrfIcryO9zRld4xkYzGBr4OS6gUc2N/YiV6cQhAZwJ/dPLw
         KiZqKbfFGPjh5jfxOWunm15xKJyZiHkW1/tdWkJHZA1QoSmTdL818q13zOkUEQKKP4RT
         VmNoYVZVOB16pAOO+DLgrm9rZPUAVKCEyYL0TLBHD+RyCsVp3dCK2OlA8F0Vl1d5Ycog
         GzzciWHd2Mc1bDDrLmrwNjWHKa25oFYpzg5VDOKpQBLedi1wXGXf0e7irZVmecaIhxoV
         XzrX16/7BvpsUaFXqFZV96N0PfMuEsPCSuLXG7vIhnYOmVqDzfhOwn3RBg7RvYxVgiIQ
         Wyng==
X-Forwarded-Encrypted: i=1; AKwUvBwiHWaVZG3hrD3/yodR7Nj6BKQG8MNxEW7ez9XEnmKoUX15tWNp4f+jRMh7o4BmQNEmWluxLbnnhbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++litAAQoSr/u5ZGq6x9gHvlJVK3r1NmcsSB6twfF7gedV+Qz4Sv
	rJD1OSpjtov7AJkc66J1D3pMWbaUR9UPZRUJ/jqnNhJ3kN5QW7K1X3UX
X-Gm-Gg: AYBFou0yWBxm6+mLHYZL9UsNKrDDTUzbflRHELd78Ez89dBYLY0fQYsQQmyWUgQypqB
	XNB8kSYNCMm48hpGZo6NTz3wVk8o8Oq/yX/BS0NS7tK8jrGahH6k6SM+/GfPdP8W5s2JmhKqZtF
	GfpKEP0k2wMSeBLjULVownEx515wbmXkcia7Igv5AR8SfQ3afadSlgKD9HK/e+KHw/5qpaDUCJD
	kLR2RjUIoY6KczoXRDBkSQsK/A7aid8TG4HDZWaUGLDO2jG4e+92YeUZJOpSlCPZjJtG/8w8lIb
	GShY7BqHhHvlnywy+HnBkdPPVf+vmKw3On43NlT9KhQVARfwqK1imdqBAGv5+P6/ossIWtOpXZa
	azRP+H9GAf1RRQZhFSxUIyOkJ6oCF7gXSu4TY+u7RfaWR0UV7kT1mbC0D1U88iT1McNj1shSHsq
	CRtDQ2f7tUXKOXXEScTq9A0wQpYPanjzQ5qmhIX4VwN/FVZoMnFRCeTMIslAuJpksic785eCfqA
	nbnGJFXPBc/bkmtvaA4enLotXjjc+E=
X-Received: by 2002:a05:620a:3182:b0:939:6dea:374c with SMTP id af79cd13be357-93a038efc6fmr409029785a.48.1789222077789;
        Sat, 12 Sep 2026 07:07:57 -0700 (PDT)
Received: from dhoja (S01067483c248479d.wp.shawcable.net. [50.72.244.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fc4a9455sm292155585a.31.2026.09.12.07.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:07:56 -0700 (PDT)
Date: Sat, 12 Sep 2026 09:07:54 -0500
From: Curtis Vogt <curtis.vogt@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/3] HID: valve-index: Reboot headset on system power
 transitions
Message-ID: <aqVcun3-ksMgzb9z@dhoja>
References: <20260910170254.833871-1-mario.limonciello@amd.com>
 <20260910170254.833871-3-mario.limonciello@amd.com>
 <20260910220421.40356e51.michal.pecio@gmail.com>
 <55918a70-72c9-4f55-934b-81a692d4619b@amd.com>
 <20260910225259.66b480c6.michal.pecio@gmail.com>
 <cb4d4f93-2e34-4c5b-b400-06fb01b6b04c@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb4d4f93-2e34-4c5b-b400-06fb01b6b04c@amd.com>

On Thu, Sep 10, 2026 at 03:58:27PM -0500, Mario Limonciello wrote:
> 
> 
> On 9/10/26 15:52, Michal Pecio wrote:
> > On Thu, 10 Sep 2026 15:43:18 -0500, Mario Limonciello wrote:
> > > > > +/*
> > > > > + * The headset's EDID service is lost when the host disables the DisplayPort
> > > > > + * PHY during system suspend, so it needs the reboot on the way out of
> > > > > + * suspend.  Doing it on the way in does not work: the headset dropping off
> > > > > + * USB is a remote-wakeup event from its hub and aborts the suspend.
> > > > > + */
> > > > 
> > > > The internal hub which will be quirked by the next patch, or its parent?
> > > 
> > > It has to be the internal hub if quirking it works, no?

The parent needs to be quirked: the breakout box's own hub, 28de:2613,
sits above Microchip USB2744 (0424:2744). Only the 28de:2613 hub ever
registered wakeup events, and quirking it alone is enough.

I also tested the quirk using a stock kernel (7.2.3) using the kernel
param `usbcore.quirks=28de:2613:j` which stopped the headset from waking
the host. Without that param I found that the headset would wake the
host when healthy but not when wedged.

> > I believe there are two separate problems here:
> > 
> > 1. resetting the device at suspend causes instant wakeup
> > 2. a few seconds later the system wakes up anyway
> > 
> > 1. is solved by resetting on resume rather than suspend
> > 2. is solved by the quirk
> > 
> > Questions:
> > 
> > Any chance that 2 also solves 1?

It does. With the quirk from 3/3 and the driver rebooting from the suspend
hook instead of resume the headset reboots during suspend entry and the
host stays asleep.

> > Would resetting on suspend be preferable, as the comment suggests?
> > Maybe it would, if the reset can race with DP seeing empty EDID?

Yes, and the log bears out the ordering concern. With the reboot on
suspend the headset is already back and so the EDID reads cleanly the
first time. With the headset reboot on resume a re-enumeration occurs.
There was no "EDID err" upon resume with either variant. We can go back to
Mario's implementation of headset reboot on suspend.

> I do think that resetting on suspend makes a lot more sense for that exact
> reason.  That's why my original PoC did it that way.
> 
> That's a very good idea to see if the quirk + moving it back to suspend
> works.

I've validated this approach works. Happy to return to it.

Diff against 2/3 moving the headset reboot back to the suspend hook:

---8<---
 drivers/hid/hid-valve-index.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-valve-index.c b/drivers/hid/hid-valve-index.c
index 43c1142b7215..f6941dd04910 100644
--- a/drivers/hid/hid-valve-index.c
+++ b/drivers/hid/hid-valve-index.c
@@ -103,14 +103,18 @@ static struct attribute *valve_index_attrs[] = {
 ATTRIBUTE_GROUPS(valve_index);
 
 /*
- * The headset's EDID service is lost when the host disables the DisplayPort
- * PHY during system suspend, so it needs the reboot on the way out of
- * suspend.  Doing it on the way in does not work: the headset dropping off
- * USB is a remote-wakeup event from its hub and aborts the suspend.
+ * Disabling the DisplayPort PHY during system suspend leaves the headset
+ * unable to serve its EDID until it is rebooted, so send the reboot from
+ * the suspend hook.  The headset drops off USB about a second later; that
+ * does not abort the suspend because its breakout box hub is quirked to
+ * not be a wakeup source.  On resume the hub finds the rebooted headset on
+ * the same port and resets it in place, and the connector detection reads
+ * a fresh EDID.  Runtime autosuspend is left alone.
  */
-static int valve_index_resume(struct hid_device *hdev)
+static int valve_index_suspend(struct hid_device *hdev, pm_message_t message)
 {
-	valve_index_reboot(hdev, false);
+	if (!PMSG_IS_AUTO(message))
+		valve_index_reboot(hdev, false);
 
 	return 0;
 }
@@ -130,8 +134,7 @@ MODULE_DEVICE_TABLE(hid, valve_index_devices);
 static struct hid_driver valve_index_driver = {
 	.name = "valve-index",
 	.id_table = valve_index_devices,
-	.resume = valve_index_resume,
-	.reset_resume = valve_index_resume,
+	.suspend = valve_index_suspend,
 	.shutdown = valve_index_shutdown,
 	.driver.dev_groups = valve_index_groups,
 };
