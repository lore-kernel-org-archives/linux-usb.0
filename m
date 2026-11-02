Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658249;
	b=RquOO7adyvUH+tkGH0Ym0agitIZK7UypeBHn3qSCo0RgmX/OvpyckiKmqg+aEQaPCJhz
	 aFUAYUcRXrRDLYf5MK9+JiEFO3USOiro9BIEyvSh9985Ziz/+EQ+sshQWsv1NYk8zuY87
	 QEO5Hae9eWAL9D9SsYD/8RB+McxeO5dy91CNfYPCsPTDVL0oK+1cNjjCIvMLGkV5/XyxH
	 0RIv13dzw1oenvBAMvlbGj0ZyxP50eGmFuam35Dp4Z+7MOVZVmIZJcLqfbSgNb+wZDk3K
	 ij17x89P8u4k7MbRinmITEtEoYcNYNMay551fvr6+d9ZVVf/J8LbeRr/AIPiC3bgxCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=reaxEXsLj9NUOWBS9g4Qr6UImQi4WW0JbOt84oAruTc=;
	b=sMTfub33IOAtSnN+3ix5xr/wZXhCmx4BTs5myY7mwcl3I6U+dpFAyvXFoTpbXwhd0u/u
	 Ey3hEU7PhnprbXfZFQo3X+DEvRhrFZBuJRIhF7kK6JyO8X/8CrzjRzxzPbBd3OJdZxDHd
	 HycGLvmA/C4vNyTe/4F4a5w2DE7ooHn/obnwbdJN1Ker5bUGW1Fkids8pOfR0wAai7P22
	 bSSAt6aGe6L+rrCvxc9gx/FnpeOkZboPt2o9OZLGlMFAcAIYN4t7NWH8g+3TpwkP0eiZj
	 NNFjn3lolBmVyj3fgQ8Y0gvjntq1bzYhQMVCn5+vya4dBmKkY8jy4CBKATmHXSy5N8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lJtTLPmt;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F76606A329
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 22:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F76606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lJtTLPmt
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1adbf62dd31so3781480c88.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793658248; x=1794263048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reaxEXsLj9NUOWBS9g4Qr6UImQi4WW0JbOt84oAruTc=;
        b=lJtTLPmteFqjcFfjFQ3RgfZhtVv/+0agNfsxccXeZ5zhUV96rjbiMoCrAnmsaOXvPZ
         IVUXL9ieC8G0FISW5YAju9FmnnxmmcFRQ7Sng5pqlfmez/80ZWg2GvGJEA4WI0HDXPNN
         UYA+zBMxZtPEJ7W2sVZKMxj6k/IH40z1hcvjykKAE0+mbyFbkyXcepxAs1mwnxsat/fW
         pQPBrhQgwlkJiY91gJ24Me+ywxC3j7ozpBbGEAwZEpp5xdmEduMGBqSy0jlpuy/UZh+e
         8Bz5PsPdx3CAbubqMYcE/oybZB4uU2L8wvREJX5XlPcOMGk/Bf52+TWM9sJnI8nSL72y
         F/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658248; x=1794263048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reaxEXsLj9NUOWBS9g4Qr6UImQi4WW0JbOt84oAruTc=;
        b=gtBWIBxwlvYUTr+GB5LH347VSHNlS1pPKhIMq8WXZ4EwyW6YZb2NqiHBt8h0fvURSk
         wC/osv3BWH+VDjbAi65YNM0krWQ1Yn5mP/yh6oQpyQkupOeN3wzasq2VFb0E1C2b6fzn
         vmYzeaPad67HneYf7sSUkJLPdGqbHhLuJvXw7SkAlotRHHJt0AE02V2ehiSFuOQ8yZGc
         Su0LT0aIU6MPCIAi4T4uWVF5cSb41ku0v4FVPQeGvI16D4MoWfuXjiXTCa1CTy8PTaB9
         STceFvp9ZwERvmfhW+V33KRN670b6LkPB1ewx3q8624Cz98rGruc7BDDmncHbgLUdY5C
         e7GQ==
X-Forwarded-Encrypted: i=1; AKwUvByhs3/Z13vWWLBMgqk0qxWpKg+s3YzWAmgYRfYed6EG8p4sdno3r7CKPGBkB/mG+bFomt6lS/jl39A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw7ZhkAx4lyx8LV1rg/p8zdZUjj2NVjwdtsz+JQEEwuIMaELFO
	M16CfdffcVC9IQoLeIEBnwpaVtfesYMxS4u/iFJo2HD4hE/C1VhYK/0P9ijooZQf5g==
X-Gm-Gg: AYBFou3zx5AlJBWTX6+3wKV98o7XX+TXKsSQ+NZ7Y45dsFTevSO8y8etV3KBxY79A09
	YmgrfwwhkOdhJza10iKc2SB2bmF/Zzmdgp4F+c1QjKQP8xes1IzOuOQMSsDTv2h7xnShIzRK+8e
	EWpBE1gR6EJ2iXMJG1q8dgCrRL+Q8gl5WTBSy3Vqa7Ag2g4efQXti8LHXSuIqjWL9zV2cfYpDeq
	FCCA8J3I3u57hKFhpUBHn8wLW6gDJ8kA3XRdPiYnYoMDKs1obBGSZAzFLZtXDubrH5vE5C+EgAs
	LfEmg56Vveb3wcg6+SDBpKR3SAAWQGbH6iQuME9D7Eu1XcehSjVhHY2+PSxM07rtaQFBC5llkmU
	QRswzK1r6ZKGeqAKDqrwcYws9LmTFmTwaicZS4b8ZKYCC/YENNxLrgGitMLdhfNY/JDRMjVi6e3
	HV/97SbgsMacW+A8daZ6HJ/ZRhP/pK7FjSglKe94qk6hfbsZaizjw/cefrbHy6GWTuqlUIeYJ1y
	BFaQhHTdHcqL33hsZhOAKCYOIyA0GVCp5SNn5YUhdy9cqR9tILv+qDtEQsnUX9TepV4fsvKVF6t
	/yt86//6qlEF04mvqHe+iAeHGbMv8OY0u6dXUZSCSFJ9R96PZT4NtyWEK536CAqtBcRBCeW3Hod
	527uPqk87fauEMQ2SwcSwuOrxeBpRU9mKST3mLMSb1y4OAyZFTqAvrj2zQg==
X-Received: by 2002:a05:7022:3b81:b0:1ae:59d6:91cd with SMTP id a92af1059eb24-1ae59d694e9mr14880576c88.38.1793658246813;
        Mon, 02 Nov 2026 14:24:06 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:ae8:2e7e:208a:acdc? ([2a00:79e0:2e7c:8:ae8:2e7e:208a:acdc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23f20d36csm154843c88.11.2026.11.02.14.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:24:05 -0800 (PST)
Message-ID: <d1557c0a-e82a-4eb6-bc91-d8106e1961f2@google.com>
Date: Mon, 2 Nov 2026 14:23:57 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] usb: typec: tcpci: don't act on unread alerts
To: Josef Bacik <josef@toxicpanda.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>,
 linux-usb@vger.kernel.org
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-12-b9751ddb9c7c@linuxfoundation.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20261027-llm-usb-v1-12-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/27/26 7:57 AM, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> tcpci_irq() ignores the result of nearly all its register reads.
> 
> If the first read of TCPC_ALERT fails, "status" is an unwritten variable,
> and its bits decide which events are reported to the port manager: among
> them a hard reset, which drops VBUS. If the read at the end of the function
> fails, "status" keeps the alerts which have just been handled: they are
> handled again, for as long as the read fails.
> 
> In the receive branch the byte count, the header and the payload are not
> checked: a count made of stack content trips the WARN_ON(), and a message
> made of stack content is handed to tcpm_pd_receive(). A failed read of the
> frame type returns a negative errno as irqreturn_t, with RX_STATUS still
> set.
> 
> The handler must not simply return in these cases. Nine in-tree boards
> connect ALERT# to an edge triggered interrupt: as long as an alert is
> pending the line stays low, and there is no further edge. That is what the
> read at the end is for.
> 
> So read the alert register through a helper which tries three times and
> reports "no alert" if that fails: after a failed first read the function
> falls through to the read at the end. Drop a message which cannot be read,
> but clear RX_STATUS, to release the line. Don't take an unread power status
> mask for a reset of the TCPC. Return IRQ_HANDLED if any round has found an
> alert, not only the first one.
> 

nit: This commit is quite verbose. It would be better if it were more 
succinct and to the point. For example, the last paragraph narrates the 
code rather than stating the intent.


> Fixes: 74e656d6b055 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> Fixes: b691a07c5f64 ("usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()")
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/usb/typec/tcpm/tcpci.c | 64 +++++++++++++++++++++++++++++++-----------
>   1 file changed, 47 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 6717ac914c6a..26c62216a813 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -715,17 +715,34 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>   	return 0;
>   }
>   
> +/*
> + * An edge triggered ALERT# does not fire again while an alert is pending, so
> + * don't give up after one failed transfer. No alert if it cannot be read.
> + */
> +static u16 tcpci_read_alert(struct tcpci *tcpci)
> +{
> +	u16 status;
> +	int i;
> +
> +	for (i = 0; i < 3; i++)
> +		if (!tcpci_read16(tcpci, TCPC_ALERT, &status))
> +			return status;

Retrying immediately on a transient bus failure is unlikely to help. Add 
a small delay before retrying. Please keep in mind the Type-C/PD 
deadlines when selecting a delay value.

> +

Please add some error log here to indicate consecutive alert read failures.

> +	return 0;
> +}
> +
>   irqreturn_t tcpci_irq(struct tcpci *tcpci)
>   {
>   	u16 status;
>   	int ret;
> -	int irq_ret;
> +	int irq_ret = 0;
>   	unsigned int raw;
>   
> -	tcpci_read16(tcpci, TCPC_ALERT, &status);
> -	irq_ret = status & tcpci->alert_mask;
> +	status = tcpci_read_alert(tcpci);
>   
>   process_status:
> +	irq_ret |= status & tcpci->alert_mask;
> +
>   	/*
>   	 * Clear alert status for everything except RX_STATUS, which shouldn't
>   	 * be cleared until we have successfully retrieved message.
> @@ -738,12 +755,12 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>   		tcpm_cc_change(tcpci->port);
>   
>   	if (status & TCPC_ALERT_POWER_STATUS) {
> -		regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
> +		ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
>   		/*
>   		 * If power status mask has been reset, then the TCPC
>   		 * has reset.
>   		 */
> -		if (raw == 0xff)
> +		if (!ret && raw == 0xff)
>   			tcpm_tcpc_reset(tcpci->port);
>   		else
>   			tcpm_vbus_change(tcpci->port);
> @@ -755,7 +772,10 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>   		enum tcpm_transmit_type rx_type;
>   		u16 header;
>   
> -		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> +		ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> +		if (ret)
> +			goto rx_done;
> +
>   		/*
>   		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
>   		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
> @@ -767,26 +787,36 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>   		else
>   			payload_cnt = 0;
>   
> -		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> +		ret = tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> +		if (ret)
> +			goto rx_done;
> +
>   		msg.header = cpu_to_le16(header);
>   
>   		if (WARN_ON(payload_cnt > sizeof(msg.payload)))
>   			payload_cnt = sizeof(msg.payload);
>   
> -		if (payload_cnt > 0)
> -			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
> -					&msg.payload, payload_cnt);
> +		if (payload_cnt > 0) {
> +			ret = regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
> +					      &msg.payload, payload_cnt);
> +			if (ret)
> +				goto rx_done;
> +		}
>   
>   		ret = regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &rx_type);
> -		if (ret)
> -			return ret;
>   
> -		/* Read complete, clear RX status alert bit */
> +rx_done:

Worth logging when you're dropping RX packets (due to ret!=0) given that 
the tcpc has already sent a GoodCRC.

Regards,
Amit

