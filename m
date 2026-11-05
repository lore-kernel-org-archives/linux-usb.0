Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907826;
	b=P+M+lAb6CxKG6dQ+trJpGNztaMBl12gYgoD6anh49fZQSezqPTV9+W84+duSPuhOFjvQ
	 wfVje34T4bts8xF5kdxkCJS5vpJEp4KUTHcTgvJqu2qEwncWYuEgTq0e9jhiM2BVJyTr3
	 TFKgMCO59Aa43O5sA6W+/8fNB0d5ooZXfBhocyah57h1TylFD0wKXRKVoTd+hjCKgo2gj
	 qHZsuxmtA9X8i4QxKLsITBJFnQJC0bHMOHZb8sxVWY/CGS3nwKF4sAMRQCZKKF7J1tFI/
	 QNlyEnF7pa2JtajIDqd1pgYH9f4jD3FNYX7x/7Lhea4IyGazwtil/PEJxyeAPfBncoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZhathjOgBLFBYBU+7Oumjoctx0BqmNgulsJHx/5Cbyo=;
	b=QjVBvrJff7RGpHoxRu9vklwEKgQn1hKR4e33eXa8Gy7YkdAcva0dpwAIzD/5RJvyfP+S
	 2jx0QOpVI80cMvTTZlFOgQE8T4fwqVemdSRN8eL5bU9oswiyCpPpytap4CHDyc62tQ2dn
	 9dVhsZQFyWLpJvrjh/FFgg/duv6OY3H8HG0t0lRrNuDN/iWeY7BnAwpcY8xvm1Swj/Y7V
	 Gw/n0hPlQcWkoUW0CLv9IFpi4GOPEQVUuBKaVW/Gri+DKCP2DV/4/3xPAyngB4AZH6GZ2
	 oCQOwtOmz5BMwBmd6BTEHAf66VoJeeT0am38/wKCbD0m4dyFol3HcZ7Jfd4gtAd9Rkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DY+zJzZ1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC4C606A6C4
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 19:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC4C606A6C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DY+zJzZ1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16038975e9.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 11:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793907824; x=1794512624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhathjOgBLFBYBU+7Oumjoctx0BqmNgulsJHx/5Cbyo=;
        b=DY+zJzZ1LbUUA7lWJslgpLY9Z8HgU6AvJnVYVQTi/G7WY56EhjFD/gz2Sb3uaPc/jp
         W/OIY72Ske8q1bobN0Iwt8Lpt8G1TkS14N5PWGqSxFwgJU8bfndF31pAXA0t2eqBq6Ur
         pKDRuP60QqoNutBgYQ5GtO7m7hlnQM/oAtlXfihhzJqE5umhtnqPVvx2fVJgT7IQ3vr+
         e6GcAgCVoihGuB2ZKlvhrakFV7qXYQM6MkGERU4lTYXmfdIMpzOeF4z9slFAmn/OT8r/
         CE+2PpQ1UHr6HXJax7/7LGixp0pHL7cWcljhNUhDEehP23+OVMoEJqMob+iQsvKuU0S+
         on3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907824; x=1794512624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhathjOgBLFBYBU+7Oumjoctx0BqmNgulsJHx/5Cbyo=;
        b=V5Gof0UZ9bVvMGyED6f37WP1rKJzfKrtwF/i8eObDcgj5/X/4N0p/woKxCQ8KOKkYo
         qEZ11spZDnPiRpzDjpZFLljz4XRxwlIFQrypVpLHvlFdF69Cta+LyYGS49tAWafdXPZy
         YtNvJEEjsdJux9BXXVQvaCZBNu6z+Ymw+ENx3SjOgceTC2RW+o6URtQK4VHsi7qgGtuJ
         x2Vn57JNfZF4MKBoIInQTEruNi65RxcXN1B8COW1eoYdS0PfbSbBHUUjT76OAP/DHxE1
         g8ObwWVbe2XixXFongROhVeSUv6x4E3lprtogU8KcznsYNcuEgXiEZXNebCUKe/YLO2y
         V+aw==
X-Gm-Message-State: APuU4Z+7785XABIQIdf/HBWKHF+oX49QYSZg6GKeGtE+cIE8MAt3sH6H
	qSssW/VS1BkPq+yak18DtAk6p7E/XDbrBx7kHBOphKULB/dxraR36OYcH9cT5nPV6wM=
X-Gm-Gg: AYBFou05mbpaJ3Kj2AJcUgdnO0a5kTeteGysCAjYfixVrXv4oUb/vVjZgnzktFnzL7Y
	GuK+zo5NWoUwq3bicx6GxeG2vXOjeQ6vTVJzorFGlsCECR562dByUhbjRt9e4eJqTOPv+RfciWv
	O4I/wGeNjMqwY6dbujYFJoeZVif3d/Xcv+X7kAICEphPDUKx5AYUomYs/fF2Z130XZp63aoyiaM
	BMdQIV5sWQxI2p4XGEzRDXlXDRZ5I61V8mlBf6A9Y7Z76+y42tAbuyaY2VwoRhNpQl6luvQd0gy
	ZjayNieNhF4B3KeVitwgDREqznjA9RQb4R5vwq8qLbY3qcGiPLCMh84crnThzTz1prkvhKirWIW
	5nDaSfmOEd3WpEsLRDN5HrsF1ATuB4wUmIFKHrXSWLpjqlpHEKmqOwEq9tjsQlN6lTvrr5JnNgP
	Kz6ulX8QbxInfcXq8o2ailf5B2gSWbMbMUqAxiSix0S+Wdwa4aY6S+WhUlnuhZNJXSghpAXk/Js
	l8F0zv6iuXJ8vXpZaK01ILAklq2u6RCYSsB0CGt9FoJp1foc1tQk+UlfrbQITFKk9OrM1pWtkiU
	QB7QtrnA//1QOtubLqhZ0dBkd7rz8GMmjoYGqh3wf1+IkAfB573xvYBljY8FwM7WLRW6
X-Received: by 2002:a05:600c:190c:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4b6e0bffd81mr2367485e9.33.1793907824242;
        Thu, 05 Nov 2026 11:43:44 -0800 (PST)
Received: from ?IPV6:2001:a61:1322:c01:9fdd:c901:f470:904c? ([2001:a61:1322:c01:9fdd:c901:f470:904c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1a1csm11424488f8f.12.2026.11.05.11.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 11:43:43 -0800 (PST)
Message-ID: <e6593c6e-63b3-4198-b587-85b5636e033b@suse.com>
Date: Thu, 5 Nov 2026 20:43:43 +0100
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
Subject: Re: [PATCH v3] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
To: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
 stable@vger.kernel.org
References: <20261014165741.35758-1-olivier.kaloudoff@gmail.com>
 <20261105173250.97239-1-olivier.kaloudoff@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261105173250.97239-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05.11.26 18:32, Olivier Kaloudoff wrote:

Hi,

thank you for testing this hard.

> The wedging CDB is already identified by the abort log: READ(16) at
> LBA 0 — the 128 KiB partition-table probe. (usbmon isn't available
> on this kernel — CONFIG_USB_MON=n, can't hot-add without rebuilding
> usbcore — but the abort CDB narrows it to that one command, which is
> consistent with your partition-read hypothesis: other OSes typically
> probe differently, e.g. READ(10)/smaller LBA0 reads.)

We should definitely get te partition code maintainers involved.
But that is secondary priority. This issue does not eat filesystems.

> Where that leaves the patch: the enumeration stall is now proven
> cold-rare and cleanly recoverable, which by your rule makes
> IGNORE_UAS look heavy *for that failure alone*. The justification
> that stands is the load wedge — two filesystems lost to a failure
> mode that only exists under queued commands. A depth cap could
> plausibly mitigate it, but I have no positive repro to prove it
> does. If you want, I can run a longer soak (hours) at capped depth
> vs. full depth, and/or test whether a first-probe mitigation
> (smaller LBA0 read / INITIAL_READ10-style retry) prevents the cold
> stall — that would let UAS stay on for this bridge with the enum
> race neutralized separately.

May I ask you to test once more, harder?
If that remains inconclusive, we will go with blacklisting.
We cannot risk filesystems.


	Regards
		Oliver

