Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24435353A94;
	Fri,  3 Jul 2026 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783114206; cv=none; b=mQdjZRNORHODi/8/K05jd0wKfzHko1fYXxFdFTZMVrd5MTG3X64/d120fOsaFkXq0E5Ls+3ppVr0irlpdgdBNKMX0VOLDEzxaqFc8OUIavi82dpCw/+DpHKxxwsskEi/r2Db37pzgjKNXUVbF10fRGpB/e4S5ENk8FjJP6FtAC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783114206; c=relaxed/simple;
	bh=i+B9ut9oKXk6krdVjC7eh1PYY1ii1zTjZoqXB1eoOZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfFJpxDc7X5dLXjwtDF3n7xhEBW1dlOuTAtgGllD1YKDuCTl0CsRTLV7QOQIAP7f0sEgISNQEdcuVce4IcG4RaHyTbAHYI+3G14TWNZpY7XlcX2Jhir0MwdNXm0nUl7qQ9TERHU1ZDfC3vAh1R7/udRMWgRb9jliuJttJ4Vap64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.219] (p57bd9034.dip0.t-ipconnect.de [87.189.144.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CE4414C2C37F34;
	Fri, 03 Jul 2026 23:29:40 +0200 (CEST)
Message-ID: <e9a01bf6-7c7f-4cdf-9eff-0cfa5f45ff7d@molgen.mpg.de>
Date: Fri, 3 Jul 2026 23:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: class: do not pin the alt mode driver
 module
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701102831.34954-2-pmenzel@molgen.mpg.de>
 <ake1nru1TZS_lQ2O@kuha>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ake1nru1TZS_lQ2O@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Heikki,


Thank you for your reply.

Am 03.07.26 um 15:14 schrieb Heikki Krogerus:

> On Wed, Jul 01, 2026 at 12:28:26PM +0200, Paul Menzel wrote:
>> Plugging or unplugging a USB-C dock on a Dell XPS 13 9370 running v7.1.1
>> triggers a WARN splat and, on unplug, a module refcount underflow:
>>
>>      WARNING: drivers/usb/typec/class.c:311 at typec_altmode_update_active+0x100/0x110 [typec]
>>      Workqueue: USBC000:00-con3 ucsi_poll_worker [typec_ucsi]
>>      Call Trace:
>>       ucsi_altmode_update_active+0x101/0x1a0 [typec_ucsi]
>>       ucsi_check_altmodes+0x92/0xd0 [typec_ucsi]
>>       ucsi_poll_worker+0x3a/0x110 [typec_ucsi]
>>    
>>      WARNING: kernel/module/main.c:957 at module_put+0x96/0xa0
>>      Workqueue: events ucsi_handle_connector_change [typec_ucsi]
>>      Call Trace:
>>       typec_altmode_update_active+0x6f/0x110 [typec]
>>       typec_remove+0x85/0x90 [typec]
>>       device_release_driver_internal+0x19e/0x200
>>       ucsi_unregister_altmodes+0x49/0xb0 [typec_ucsi]
>>       ucsi_unregister_partner+0x9e/0x160 [typec_ucsi]
>>       ucsi_handle_connector_change+0x386/0x420 [typec_ucsi]
>>
>> For a partner or plug alt mode, typec_altmode_update_active() takes a
>> reference on the bound alt mode driver's module when the mode is entered
>> and drops it when the mode is exited, to keep the driver from being
>> unloaded while a mode is active.
>>
>> That reference counting is unbalanced.  The get and put are keyed on
>> adev->dev.driver, but the alt mode driver bind/unbind runs asynchronously
>> and is not serialised against the active state changes issued by the UCSI
>> poll and connector-change workers.  If the mode is reported active before
>> the driver has bound, no reference is taken but adev->active is set, and
>> the module_put() on unbind then underflows the refcount.  try_module_get()
>> can also fail when the module is already going away.  These are the splats
>> above, seen for years via Fedora ABRT on several Dell laptops.
>>
>> The pin is not needed.  When the alt mode driver is unbound—including
>> on module unload, which unbinds first—typec_remove() puts the mode back
>> into TYPEC_STATE_SAFE, clears adev->active and adev->ops, and the driver's
>> own remove callback drains its work (cancel_work_sync() in
>> dp_altmode_remove()).  The mode is torn down cleanly without the extra
>> module reference; all it ever bought was making rmmod of an alt mode
>> driver fail with -EBUSY while a mode happened to be active.
>>
>> Drop the module get/put instead of trying to balance it.
> 
> It looks like there is a bug in the UCSI driver. Before we go anywhere
> with this one, please provide a fix for the UCSI driver where you make
> sure that the reference count always gets balanced. Let's not hide
> that issue with this patch before that.
> 
> As a side note, and as background, almost all Dell laptops seem to
> have issues with EC firmware not generating all the UCSI events that
> it should. That's why the "poll worker" was added to the UCSI driver
> in the first place. The Dell laptops just don't report all the
> connector state changes, especially related to alternate modes.
> 
> Dell should have been informed about the issue, but especially with
> the older laptop's, I guess they are not willing to make any changes
> anymore.

Unfortunately, I am not expert enough with USB and the code, so I am 
taking the easy route, and just paste what Claude Opus 4.8 came up with:

I traced where the imbalance comes from, and I don't think it can be 
fully fixed inside the UCSI driver. Let me lay out what I found; please 
correct me if I'm wrong.

The reference that gets unbalanced is the alt mode driver's module 
reference taken in typec_altmode_update_active() 
(drivers/usb/typec/class.c). The get and the put are both guarded by 
adev->dev.driver, i.e. they only happen while an alt mode driver is 
bound to the partner alt mode:

     if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
             if (!active)
                     module_put(adev->dev.driver->owner);
             else
                     WARN_ON(!try_module_get(adev->dev.driver->owner));
     }

The UCSI driver drives adev->active for partner alt modes from 
ucsi_altmode_update_active(), based on GET_CURRENT_CAM. The problem is 
the ordering against the asynchronous binding of the alt mode driver 
(e.g. typec_displayport):

- ucsi_check_altmodes() calls ucsi_register_altmodes(UCSI_RECIPIENT_SOP) 
→ typec_partner_register_altmode() → device_add(). On the first DP 
hotplug of the boot, typec_displayport is not loaded yet, so binding is 
deferred to udev/kmod and device_add() returns with adev->dev.driver == 
NULL.

- Immediately afterwards ucsi_check_altmodes() calls 
ucsi_altmode_update_active(), which sets adev->active = true while 
adev->dev.driver is still NULL. The try_module_get() is therefore 
skipped — no reference is taken.

- typec_displayport finishes loading and binds. adev->active is already 
true, and typec_altmode_update_active() returns early when the state 
does not change, so the get is never taken retroactively.

- On disconnect, typec_remove() now runs with the driver bound and 
adev->active still true, and does the unconditional 
typec_altmode_update_active(adev, false) → module_put(), which 
underflows.

The second splat (the WARN_ON at class.c:311) is the mirror image: the 
get can also fail because the module is already going away, yet active 
is still set, which feeds an unbalanced put later.

Both the poll worker and the connector-change worker take con->lock, so 
this is not an SMP race between them; it is purely the bind-vs-active 
ordering.

Because the reference lives in the class layer and is skipped based on 
the driver-bound state, I could not find a way to balance it from UCSI 
alone. Clearing adev->active in ucsi_unregister_partner() before 
unregistering only moves the module_put() from typec_remove() into UCSI; 
it does not add the missing get, so it still underflows on the async 
path. From the UCSI driver there is also no notification when the alt 
mode driver finally binds, so there is no clean point to take the 
reference that was skipped.

So it looks to me like the fix has to be in the class layer, either by

- (a) tracking in struct altmode whether the module reference is 
actually held, so the get and put always balance regardless of when the 
driver binds (v1 of this series tried this; I can redo it without the 
WARN_ON and the flag races that were pointed out), or
  

- (b) dropping the module reference entirely, since typec_remove() 
already tears an active mode down safely (this v2).
  
  

Do you have a UCSI-level approach in mind that I'm missing — e.g. a way 
to defer the active update until the driver is bound? Otherwise, which 
of (a) or (b) would you prefer for the class layer?


Kind regards,

Paul


PS: Just a note, gemini/gemini-3.1-pro-preview found two more already 
present issues [2].


>> Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
>> Link: https://retrace.fedoraproject.org/faf/reports/542503/
>> Link: https://retrace.fedoraproject.org/faf/reports/1278469/
>> Assisted-by: Claude:claude-opus-4-8 [Claude Code]
>> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> ---
>> Changes in v2 (addressing review from Greg Kroah-Hartman and the
>> Sashiko automated review):
>> - Drop the alt mode driver module reference counting entirely instead
>>    of balancing it with a tracking flag; the unbind path already tears
>>    the mode down safely, so the pin is unnecessary (Greg).
>> - Drop the WARN_ON(), which could reboot panic_on_warn systems (Greg).
>> - Drop the large explanatory comment (Greg).
>> - No new struct altmode flag, so the unlocked-flag, wrong-module and
>>    double-put concerns from the Sashiko review no longer apply.
>>
>> v1: https://lore.kernel.org/linux-usb/20260701062417.15314-2-pmenzel@molgen.mpg.de/
>> sashiko: https://sashiko.dev/#/patchset/20260701062417.15314-2-pmenzel%40molgen.mpg.de
>>   drivers/usb/typec/class.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
>> index 0977581ad1b6e..ca19eb2a3c645 100644
>> --- a/drivers/usb/typec/class.c
>> +++ b/drivers/usb/typec/class.c
>> @@ -304,13 +304,6 @@ void typec_altmode_update_active(struct typec_altmode *adev, bool active)
>>   	if (adev->active == active)
>>   		return;
>>   
>> -	if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
>> -		if (!active)
>> -			module_put(adev->dev.driver->owner);
>> -		else
>> -			WARN_ON(!try_module_get(adev->dev.driver->owner));
>> -	}
>> -
>>   	adev->active = active;
>>   	snprintf(dir, sizeof(dir), "mode%d", adev->mode);
>>   	sysfs_notify(&adev->dev.kobj, dir, "active");
>> -- 
>> 2.54.0

[1]: 
https://sashiko.dev/#/patchset/20260703110738.8457-2-pmenzel%40molgen.mpg.de
[2]: 
https://sashiko.dev/#/patchset/20260703110738.8457-2-pmenzel%40molgen.mpg.de
