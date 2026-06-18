Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6735E937
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780486; cv=none; b=NqAYHc75HzcyXZIbcWk/i7+e8cXLwQTPQGwZzZLJ1/ghIu8jrAElz7IfBz13alkQSo+2m2pVL2XZv/0vJPAX4NUR/cq8O9dubQKNlFgAT/j3HUxVjg5HCcxEZhwolY04iI9I/b2IHLhco+rImq4ccZvKPJNiIuEKak+WTzn4exs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780486; c=relaxed/simple;
	bh=ohN/FIDdvwk3+o1HVeaJp8hjSFEdqxA1uWlnKhI6S/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ltl3FC0B3XNEqv7idV7wYBuwpmudxZgW9AWWI9F22xkxL9JHCyl51Q1loCtslSXPeTMVGdzrSNymLx529ReIzAc8/uwfHPUfX/DcZVG1sjVEo5KRsbJxxYYGRNkzAMgPjh6xk9Zmwvu7Kj+/k2e64PPGBucQlFGmT46ynjMma4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1waAUW-0004mq-SN; Thu, 18 Jun 2026 13:01:00 +0200
Message-ID: <43e13854-a634-4706-bc12-723c871a5579@pengutronix.de>
Date: Thu, 18 Jun 2026 13:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: add trace point for typec_set_mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20260617-typec_set_mode-tracepoint-v1-1-bdfbb39cfccd@pengutronix.de>
 <ajPO6roV4HRZYGNd@kuha>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <ajPO6roV4HRZYGNd@kuha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hello Heikki,

On 6/18/26 12:56 PM, Heikki Krogerus wrote:
> On Wed, Jun 17, 2026 at 10:03:04PM +0200, Ahmad Fatoum wrote:
>> --- a/drivers/usb/typec/class.c
>> +++ b/drivers/usb/typec/class.c
>> @@ -20,6 +20,9 @@
>>  #include "class.h"
>>  #include "pd.h"
>>  
>> +#define CREATE_TRACE_POINTS
>> +#include <trace/events/typec.h>
> 
> Those should probable go to drivers/usb/typec/trace.c and then you
> need add something like this to drivers/usb/typec/Makefile:
> 
>  obj-$(CONFIG_TYPEC)            += typec.o
>  typec-y                                := class.o mux.o bus.o pd.o retimer.o mode_selection.o
>  typec-$(CONFIG_ACPI)           += port-mapper.o
> +typec-$(CONFIG_TRACING)                += trace.o

Thanks for the suggestion. I will do that for v2.

I also saw there is Sashiko AI feedback on this patch[1], but I am not
familiar enough with how the event headers are used outside the kernel
to determine if that's actionable advice or if it can be ignored.

Do you have an opinion on that?

[1]:
https://sashiko.dev/#/patchset/20260617-typec_set_mode-tracepoint-v1-1-bdfbb39cfccd%40pengutronix.de

Thanks,
Ahmad

> 
> 
> Thanks,
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

