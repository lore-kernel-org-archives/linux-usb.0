Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092899;
	b=iJXKbQn24IzWjeWYEg0V2FFL03nVahUeXfeFSiDgX/92cxgX8Qp3nm/QvC1mzILFdTot
	 nTWfcmhAmqpuvxwBP9LqCu5qmy44YL9q5wrqa6zNKjI+Cl1nOWxSQcRy5Yx8G7/euKfwB
	 ux9CY8SdtZPKj1I2CXAtArcKun3W5FHalZOUE8VpjKqhkQArS/q6y3F4VFfErd7XVRJys
	 agLIgkKKb+lYqfekr4tKH6X8QP8R9Ug+or+6XkXEUsKlsuzRkajyv5LRjA3hFhm2RF+Co
	 GUSB7zXl96MPv1DGc7YS79J6XTdrgM+AM+wq2wMUl78Z0ynpWN7rCQpCbZh4lhSkFdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7ADcUnp4proYsWbdFg56tAcNwpkklMHnW/J4M42WqqU=;
	b=CIIGKLQT9lw5awabqKUZxUS3NTrwShQj266Uy9B8aAK4Hc6k/TesXjEhJI7F6Un1RC66
	 WHAy/wlhFVs5wpAJQAmfZy78M1jo+NXnQ2VGgp2LLYxllqCN271ecVsSVrpsPQblOSvNU
	 HKGY+o58fj0jLUzbdvfTz4L9RIensLOdfj3IjkrnaCo6C/2mn91benPqSXK4rv5X2W30s
	 xIZyhsXx1eWQ/m/212skFGb1oDXrx5Fjx5qc1THwWa/Or5rJ4L/SYh66uhYBPz1iCFkHK
	 6+IQrFbCUgVhorI16rGSlmlKDMk0Ar+jHWzJdWiegX8PgOh/cjsq9u82pcthjkVgvnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HKeto6TE;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20591606A32F
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 09:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20591606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HKeto6TE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39626325e9.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 02:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793092897; x=1793697697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ADcUnp4proYsWbdFg56tAcNwpkklMHnW/J4M42WqqU=;
        b=HKeto6TEqhT/Kmt3LtGRwmpX3Qjn2/N4v80HIvwRBwzBca+QWFl2eRdlqdQRNjceZx
         Kv0z9sU6QaAlA660MPA2nM0wWxC3ya86QEwfutyzhfw/XYBsfQKwhnAxuSPXDa3Y9ZBS
         XDf8Xa9xcm6QPOU6gpG65nPRbOXiwImy2PpqulEQAL2gt7eDckC+dhH7yjB2VhwyqPod
         gcLiKMwaLvuTV9HYAtNMByfHgN+388Athul+NhaKGwgqMdsZ78YRrJr5jlUBFZp2dYzo
         fyGHHEEXpugjCoRtFOgXZt+J5nr91ZlPsmaxroz6RiDepTn/BNYcVo7ODXAyrrGhx5vl
         ALkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092897; x=1793697697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ADcUnp4proYsWbdFg56tAcNwpkklMHnW/J4M42WqqU=;
        b=RFuYdXTSEIyf2VoZmPJGFcc4wJgFe2l47o7tIBn3fUVwAvzHlfcw7/yu5P+NDO3nLR
         4/I6MWsAGu0b2CEaG5WwOWX4kgNcDRpyQGlgcxLe7W8r9cmnSQnAafyuNP2DEzWDMOPM
         bbuLd3roevqEC5gDR3+IOyxI5L6WNZ3uI+8H7deYSI38EDjmjr+LYNu/gH/wZ7N3IXZk
         bR79tdRvSOD7ofBraqLcgPW3Wx+ZqO69s2ZwKBYrkeUj1MUYDZ3sm2S1M+lbn9oZvEzU
         ewYcMgAGOKTlS5P1IvwMT09ud/QN5JQ42EiE4wg+/ciCInnsC4kmAj7LA/BG88tM71tu
         ao2A==
X-Forwarded-Encrypted: i=1; AKwUvBxNrZAJU/l0Pca8ZbxxTQ6pyKmElc42M7HKKBjgvZHwbgZXNmVeVJsINgF7oVoDvnaMBswaIml5LBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsPWDPO8YtWnDbzm1yYx+JFXrp5eGXwwIyBU9ZIqwF5vz/3DWV
	F+Ty/yiqs71x2jDUZlQ0n1pIYVPHu2OmZsjFK+LC4URwXBtdXcQ7TYYsn1eX5XF0ovn5KTgtN1p
	awLtt
X-Gm-Gg: AYBFou05pyRe/SGKBLQf+gTmQ8PrVSLf6PUMu9qDdJw56tS2FP5T+ZrwRicQbFqnZLF
	YE+BSfW+GJYgmcXaadnZex+TFLbkvATQSKAbIvmP4W2hCGKAubmlV/zDRaDty4KSAS63heNlZXM
	aTXaefdeCqjQuwo+9NO+W/l/f7LfZEPQg4XDXQycibBZGsctLYIwSmOWC2M8RITIJ0GP0YV1KWr
	n3ekhokwL2rCUJYry9ZAK4Ft1/Dr6iPGwMY2rwF1fCp+lM7kuYOpuWRZ27JlKEvy4Hp6+UBWqFp
	sFM8raFiaZITjvY0yihqAUIThijrlmKeGHwC4lPKAhkTlpG//4P8mJ3b7ww75z5CdlLopxfZLYn
	pWPOpJaiEWXq2BhQTuie2nVfIk3DclXwgzt+1RIVrDTwxt/g9iWBybW5bPdr+2MQu1P5dKfueSM
	FzqiNnxFMQn3H3mSl9dYr70Jkr17N8dbFI38UMRsRF8VtHb+ZwN30sWkJWvdi5NhXawtiyC0w30
	ZuGJ9o7QGjOk4YJ5tKkVXXZJ8F8a3u+vF3API4ZQLcH5H7am7Dd72A5ApEODf5m3wrfsjJP00hO
	+QMabgQS294mOdKmVE3RTg==
X-Received: by 2002:a05:600c:4e87:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a35acafe0dmr181678695e9.6.1793092897467;
        Tue, 27 Oct 2026 02:21:37 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a7:df01:6e79:f35a:ab88:b157? ([2001:a61:13a7:df01:6e79:f35a:ab88:b157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm21839576f8f.1.2026.10.27.02.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:21:36 -0700 (PDT)
Message-ID: <caa4542a-f1af-4a24-bc1f-f6c17d6e93ee@suse.com>
Date: Tue, 27 Oct 2026 10:21:35 +0100
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
Subject: Re: [PATCH v2] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <e6009e1b-2d95-4350-8374-d5930200ed24@suse.com>
 <20261027073800.648951-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261027073800.648951-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.10.26 08:38, Jiayi Li wrote:
> Hi,
> 
> Thank you for the review.
> 
> On Mon, Oct 26, 2026, Oliver Neukum wrote:
>> 1. If an error happens while disconnect is running, why do we want to schedule
>> work?
>> 2. Why only this and not also scan_work?
> 
> devinfo->work retries allocation and URB submission for commands already
> accepted by UAS. Those commands may need further URBs submitted before
> they can complete, so I intended to allow that work to continue while
> new SCSI requests are blocked.

Even if an error occured? Does it make sense to wish to complete
commands that have failed while the driver is being unloaded. 
> However, the existing queue_work() calls already schedule these retries;
> flush_work() is not needed to enable them.

Indeed, but shouldn't we cancel scan_work _before_ we even try to complete
commands?

[..]
>> Some commands run longer
> 
> Yes. This is intended as a best-effort grace period before cancellation.
> The timeout values were taken from uas_wait_for_pending_cmnds(); they
> were not selected to cover the maximum duration of every SCSI command.
> 
> If a command remains unfinished when preparation times out, the
> existing cleanup proceeds. An affected bridge may still require a
> physical disconnect and reconnect in that case.

Understood. We need a genuine cancellation code.

>> Is the resetting flag even needed anymore?
>> If it is needed, why set it so late?
> 
> resetting is still needed before scsi_unblock_requests(), so requests
> dispatched during the remaining teardown cannot submit new URBs.

Yes, but that doesn't answer you why you are setting resetting
only _after_ waiting for commands to complete.> 
> Setting it before preparation also prevents the submission worker from
> progressing and makes the status and data callbacks skip normal command
> completion processing. In the hardware comparison with the flag set
> earlier, the URBs returned, but the command table remained populated
> until preparation timed out.

This answers it, but why do you unblock the device then at all?

	Regards
		Oliver

