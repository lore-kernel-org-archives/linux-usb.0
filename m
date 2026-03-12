Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0B338B149;
	Thu, 12 Mar 2026 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773312575; cv=none; b=bG0LKPBEAVBBHmmXdBbUSauFK4jYBKNEe+VW1pN51vxZlrpnqaGyNI8B7ZoMeSfADRf5X3aihLeuQAzY/Y/nk7YLDNx3apUYJDQX7Odt75d4Xtgq5X4+eAM4mNDWf0CUjwsWrnE35umY490j5mFcbbN4FNQIiiECYsVBCb+KGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773312575; c=relaxed/simple;
	bh=lxe0dzp45quZ5iBSrAxdBEKN62C9dM8xYA0GWTrBltY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFoA9MPLW+0dRPvNJKiDgQp1qCeRmRMkKfkMfBlq3tdkEuOXi7ZQRyIR7ZkvS93dhyBe2eEgeczeR9xs0GMWy1Ar2P5kySOCU231aBTYkrdIGVaF8uRCpglPdj45wX+BUFS2AXJvXGwKNPzPUW9I/nLdJDPZ7PKlFSj4cfXviAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1IIl8Wb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1IIl8Wb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3644DC4CEF7;
	Thu, 12 Mar 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773312574;
	bh=lxe0dzp45quZ5iBSrAxdBEKN62C9dM8xYA0GWTrBltY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u1IIl8WbAa5sahVST6Eof+VGhimnE1w2uBh3mTYfj1KTgV7MAgHLNuA0FoTt1zOV1
	 C9zIZl5aGy3ME8JHm/MjC6yOc17bUMcPIXgyiNYwwugatsj+9PZ+hPYjHE8Ez/mNXA
	 NRIJtxYju5tghs+/fkivpy9BX5ioznjQvu/tLCJBxv2NIOZar5GECPkZkUKSDxNTm8
	 LDp17z3RUAsdFzG4v6N+WXosaqT2AvSqHDusL6yW7EgkTwq4u+L2n5MxUMicU0qw83
	 J9aACntH8senAIGNV/h/zhliFaREsqJYHq7QFjp8kvNg8fU2pEEQfXnCAare3fGIcS
	 v4Wy3ta9VNPxw==
Message-ID: <63dfd90a-d54d-4d87-8c62-61a3c24d76fd@kernel.org>
Date: Thu, 12 Mar 2026 11:49:30 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: fusb302: Switch to threaded IRQ handler
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexey Charkov <alchark@flipper.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Yongbo Zhang <giraffesnn123@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260311-fusb302-irq-v1-1-7e7105706629@flipper.net>
 <abKDG8wHJ-19c3AD@kuha>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <abKDG8wHJ-19c3AD@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

+ Sebastian Siewior <bigeasy>

On 12-Mar-26 10:10, Heikki Krogerus wrote:
> Adding Hans and Yongbo,
> 
> Wed, Mar 11, 2026 at 06:57:12PM +0400, Alexey Charkov wrote:
>> FUSB302 fails to probe with -EINVAL if its interrupt line is connected via
>> an I2C GPIO expander, such as TI TCA6416.
>>
>> Switch the interrupt handler to a threaded one, which also works behind
>> such GPIO expanders.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 309b6341d557 ("usb: typec: fusb302: Revert incorrect threaded irq fix")
>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
>> ---
>>  drivers/usb/typec/tcpm/fusb302.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
>> index 19ff8217818e..4f1f24737051 100644
>> --- a/drivers/usb/typec/tcpm/fusb302.c
>> +++ b/drivers/usb/typec/tcpm/fusb302.c
>> @@ -1755,8 +1755,8 @@ static int fusb302_probe(struct i2c_client *client)
>>  		goto destroy_workqueue;
>>  	}
>>  
>> -	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
>> -			  IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
>> +	ret = request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_intn,
>> +				   IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
>>  	if (ret < 0) {
>>  		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
>>  		goto tcpm_unregister_port;
> 
> While this looks okay to me, since this is now being changed back and
> forth, let's look at it a bit more carefully.
> 
> Sebastian, Yongbo and Hans. I would really appreciate if you could
> check this, and give you ack if it's okay.

Using a threaded interrupt handler should be ok, yes. This should
also fix the issue this patch tries to fix:

https://lore.kernel.org/linux-usb/20260103083232.9510-4-linux.amoon@gmail.com

which I did ack after some discussion.

But I wonder if we need to re-add the ONESHOT flag Sebastian Siewior <bigeasy>
added then ?

Normally an i2c device like this would use a threaded interrupt handler to
do all the work since I2C transfers can sleep combined with disabling the IRQ
on suspend to avoid the interrupt handler running while the parent i2c-adapter
may be suspended.

The problem with the fusb302 is that it can be a wakeup source so we cannot
disable the IRQ. I worked around this in commit 207338ec5a2 ("usb: typec: fusb302:
Improve suspend/resume handling") by moving the actual work to a workqueue
and have a hard (non threaded) interrupt handler which disables the IRQ and
queues the work, with the work re-enabling the IRQ when done + special
handling for the suspended case. Basically our own manual oneshot.

If we move the IRQ disabling to a threaded handler, which appears to be
necessary for some IRQ controllers (arguably a IRQ controller driver issue,
but this seems to be a re-occuring issue), then I wonder if we need
the ONESHOT flag again to avoid a level type IRQ re-triggering before
the threaded handler gets a chance to disable it (with the workqueue
item eventually re-enabling it).

I think we need to re-add the ONESHOT flag, but maybe that is the default
with a primary NULL handler ?

Sebastian Siewior I think you now the IRQ subsystem better then me,
any advice / remarks ?

Regards,

Hans







> 
> Br,
> 

