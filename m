Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825249;
	b=XNKRGfQsK3Vz/oXcOTTnB23SVh5q6IKbIZMSrNlSzZmn4Xlp/0Vx/HMYz8g1DqjnoDrX
	 9025IFm6euBI8SNyrxH/22+NNS4u2r2SVkhOwi72ffFzDvAMfcFvA4jDUBkB6IYCoChb8
	 R3uDzmaVN9CkI8WRCWV6BZmJ0ik/f8WXb/t3AP2DdNlJeNkfrqeQl55Hn/W5tvKSgl6fF
	 2Niwn8KFWhJmQX9eEP58NIj2IVPS9sTmRJJKCj6cCBW2fhDLMzYxC1wNyJlVTiwvbrjfy
	 tGZhrqeqztB757pJi6HnRDdbsfbrY9wiOWElDnXdvGlN6lNmuZ9IOmxuD3yyYFqizXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kjRniyVLiwC8loqttMlkxnc/xjaTsxXPTgu8dwU8Z80=;
	b=TwHTd1G/p/EVR4HgW/JQD6PXjVEkP0wYUKhOWZGN6O82YRVv0l4QZkBJN2yC3XX+idaR
	 rA/n+8jEayI5FoekdzFSapZ2tiM4dqzkXlQ7Hgnz8GYxM69t1ecCbD8gkgeL5L/RUCy0t
	 EbnlsUo24Wrl0BWsQ+B+woOQYojTOdl8LQHWOgtUhgIYSpEKV0L0qqQVxSYeid6a43WN6
	 gcf9TasdxN4rGcmI9YB89xfPeXxM2KjC++lbytgtEoznl/nkKIRoGZqvZOf+YYmb52M6E
	 2UkXuSTeltl0XUXX/DLvHzmxeziz1vqMSxNiZAocJNogyh9FaL8RN2/OrAt01eiem4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dd+REv3f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SIyJTDih;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4A606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C4A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dd+REv3f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SIyJTDih
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA4Oew1228075
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjRniyVLiwC8loqttMlkxnc/xjaTsxXPTgu8dwU8Z80=; b=dd+REv3fu98aQPzh
	po2W7AYFc/JGYTKf6LV2NTUP7Tdht8kOSEr/f15GONXxQNZHIJ6lcaFSssTyyigy
	jwDpADD7aAH3LEGRJ9giTFM5yEkgfY9VJznVTtox8Mx+rISU1VmS1ke0PqBKcqu3
	qVidfp7+xTW+QKgW3kF43RKqGBIwT/pUm6rGlFpVYT7/Z68DEkwfPcA0HxaseVcY
	O/ZOUPy30Bu1JF9sT1ViGBk3vtIqGl+u0mKHSFVaMTrgSDuwCsXfhBqFCYiDyB2P
	CwapQv4ezEncaGomuPtdb/U3JcpGbgOJw3XrAfpyu90FkCuFK2jmusssVp0VSv4h
	XZytUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqg3bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:34:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so238366185a.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 02:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794825247; x=1795430047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjRniyVLiwC8loqttMlkxnc/xjaTsxXPTgu8dwU8Z80=;
        b=SIyJTDihNIxoZ7h/6J6gnGTExOTqWzKnJpYkucSRXYQMYK8+oqwKmLFp4K2rNjOYH3
         iPZwx67xE7np+2Y4LhugI/m1CnEqh9rG69WN4O+OJUVChB3lf5Cnik7SIXTLCRWxKxL2
         NmS8HOiZx9sUlUtx6MAWJGPCKyHkbkhpPoUD07eFkYXzLp0hElXnaUgs3oFQgilk5Mw4
         isstCfYAj/hxtYmOg5jQib5V7CyO8VSM1wxyfehjQ8DtKxJPOXjflvBdzB6PmeP5QnvQ
         P7xyF3tLZ7BWKO5aihlRnPKXUX35wZxxao6by+BAxRJhMMHnyYV+qlPFq8zKrbK1EiGi
         OV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825247; x=1795430047;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjRniyVLiwC8loqttMlkxnc/xjaTsxXPTgu8dwU8Z80=;
        b=RkV5hJdkah33J8Zjwz+Wfq452X90sznlA0hE1QN1xqH5Zela1dY2/k8EjpVV5xVBky
         yPGUCzBROD+OvnZVzest0Zly+pFhHtiiKxjS/j++FF2o8EJfJlGqNDOSCodfeExkkZH+
         Jh9sOHxn54vc2A02AAMY6BJKY70DNTI4OtoCGIYpRE7LjQE42xY0WUnt18Pbz3GvA6RG
         ZPC6lWw2hxHbBdy4Mk/JgkA7vGcp7LyKEnU3pMbyqDpmBnKQ2oVlcCx2J6HPra5/G8KW
         6GM+tSnj+Qf4bWLwC2Ben0nSADJLUXBq9ZmW5WN32s9KeZA6CbjPIQxGZS7y2Yu42L0p
         yKcA==
X-Forwarded-Encrypted: i=1; AL+hErEv5+EXIt+rJwrMQeaZNAtMRsn4eEvryyUyFdg8zO43V5OVXtIGJo9lpy2RnilrgkDUXwRC2W03B5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nSj7K0vaDnywSBQO5xLLtYxMk2jtAgpohBgsL9D8ETUnnLGrH
	wPSuYpKO0vHhH/kFdWPQkq4JdAoS/0xfCDRh/G3qQxyrCBJJW6lwjWEa0NUJGrg7rtot9Wu2YHW
	Rel2gpJWmVnjGFniehh9j008wIQGnBFfBalyz09EKZpqW9/iyQT7aVZfSSTcaFhI=
X-Gm-Gg: AYBFou32Fw+W7ZiYHGRdeI8ztc4x8nHMjk+4PWlvtZhvVxbti76ZJM8mDemR4Ieeact
	B1vGQPVKY4HRBMJzTu3+ITiHJUfeWs4uE/vOu+YWK4UccaeABIkutu0Fc17/lIgcBhV1y7CRGor
	rRIMf5fCSOeG/J6Bt072DF8NC8fhTK8prJK+abPl0E4bIA/wVtThHy+n0zxRGpPNzZJz0+4N1c/
	tVBfnJqXUC/1Ju4Ci/vrSbowdJ3iiRGDmLcsL4EIB99PMVhBJl/hYDvofagtPNnx0fToLUCNF0A
	f2SIqm+5EhBN/PQ54DeDePJ/bOpLcNz2Wn6faaNLEk80boVuMkFmo0xk9b8Ni6kYcRhIID3lQz6
	tzYhwed2pzBTNrJdj92VuOyOwc59MOklI62p6duk6k7fy7pdD7v1QEUCSVuE+QOPODeyUBUEIOq
	f0D8M4mmiK8qBwtledMAygX3hdytizCsoX88wD
X-Received: by 2002:a05:620a:4487:b0:93c:d209:4ea1 with SMTP id af79cd13be357-9493308d904mr2048099385a.24.1794825247197;
        Mon, 16 Nov 2026 02:34:07 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:93c:d209:4ea1 with SMTP id af79cd13be357-9493308d904mr2048096385a.24.1794825246723;
        Mon, 16 Nov 2026 02:34:06 -0800 (PST)
Received: from [172.18.133.33] (195-200-21-10.mclarenap.oninferno.net. [195.200.21.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm385068215e9.2.2026.11.16.02.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:34:05 -0800 (PST)
Message-ID: <ef8240da-5a29-41f5-8700-8334d82a8d6d@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:34:03 +0100
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: "thunderbolt ... (DP): not active, tearing down" error breaking
 DP over thunderbolt displays
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
References: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>
 <20261026052331.GC158991@black.igk.intel.com>
 <fcbac09a-be91-4fac-ae0f-934f628afa01@oss.qualcomm.com>
 <686b2d33-7a50-44b7-940c-70c30f4c941d@oss.qualcomm.com>
 <20261026123716.GF158991@black.igk.intel.com>
 <b0bc482a-f739-4c9b-8eef-9e2634ab2e02@oss.qualcomm.com>
 <20261026150229.GG158991@black.igk.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20261026150229.GG158991@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afadc20 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=LwtOfSRbDNzKn4Mtwg6Q5A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=laWNcg8tGngPNvab1hMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LLGJbXk2NwOVlFLboPRoKSoAp4nFNcET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfX/o5/gtSKzvnp
 V9ZF0J8jG2zElY3FWvCAcGOD7JVUnZ1S7/bIksbSQK7olIg7nSLcfvSUWh5okvLHpIlmOcGhO+W
 Oz/dA3ptxW0IkfFjVmPqBWMYI6HCgweL1KGhEVWKKQyud5tUmO/2OA2lSwAicesVTY45yKwvchS
 Vv5beQYu0Sm+sPM9Kd9VOEhGdJrXvyFr4+/l2XmXPNnTzjeLwruBrZ+Lgi0N3KaVoHffqEI9jed
 YGQPedeg1Sj+3DGSK2jiFGx2aNoLOv3FgUa0pET1l3hpmZ2Tjlnu0t+biYKzZCHaMtWoE4iBjp3
 84Hxx3SbhV9TTDxh/nthNO5LYhhip7XqIvB0SrbqkFaHLV/j0jCNsI6ExLVq+WByHjpkhNCYX+5
 CiV/Etj9QtgtnzdLLMSL5lezWSekd7eGc67puGLPZjvAQOGZkBlKnDiHZtLEn9q5puRYuhd9iY3
 k31J7TqNTQVrJHEXu6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfX7z8jDY6KSfck
 BHS+VJ3HPXkBlyM3lEPKpAaD7DgPnYGBCPpjOplqVOaWOCbG8hgfyTYlD8V3xSFB219mAnksEd6
 aQzePtzF5gDCDpRCVwKLkjRD0/PhaGM=
X-Proofpoint-GUID: LLGJbXk2NwOVlFLboPRoKSoAp4nFNcET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160041

Hi,

On 26-Oct-26 16:02, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Oct 26, 2026 at 03:22:06PM +0100, Hans de Goede wrote:
>> Hi Mika,
>>
>> On 26-Oct-26 1:37 PM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Mon, Oct 26, 2026 at 11:48:06AM +0100, Hans de Goede wrote:
>>
>> <snip>
>>
>>>> p.s.
>>>>
>>>> We had a similar problem with deferred_probe_timeout handling, see:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/Kconfig?id=56e3ee721b33bdc4ce0765d370983aa4384f8a59
>>>>
>>>> there this was fixed by making the default timeout value a Kconfig
>>>> option and letting distros override it since previous discussions
>>>> did not lead to a consensus on how to handle this. But that won't
>>>> work here if we want to deal with the "complication with add-in-cards
>>>> that don't have all DP INs connected" case.
>>>>
>>>> I'm mentioning this because it shows there is a generic problem
>>>> with this "timeout design pattern" trap us kernel devs seem to
>>>> keep falling for, especially in relation to things not happening
>>>> in the initramfs while it waits for user input causing all
>>>> these timeouts to trigger while they should not trigger yet
>>>> because more drivers will load once we switch to the real rootfs.
>>>>
>>>> This has made me thinking that maybe we need a bootup-done
>>>> or at least switched-to-real-rootfs sysfs file userspace can
>>>> write and only start timeouts like these once userspace has
>>>> written that file?
>>>
>>> Yes, I think this is the way to go forward. Then something (like
>>> notification or callback) that drivers who are interested can opt-in.
>>
>> I'm glad you like the idea.
>>
>> There are some details which we need to work out. If we enable this
>> unconditionally in the kernel then all timeouts based on this will
>> only work if there is a new enough userspace to actually write
>>
>> "rootfs-mouned" or "bootup-done" to:
>>
>> /sys/kernel/boot-stage
>>
>> So my suggestion would be that the initramfs itself will write:
>>
>> "initramfs" to "/sys/kernel/boot-stage" early on and that activates
>> this mechanism pausing any potential timeouts.
> 
> I wonder if using SYSTEM_RUNNING and the like here would do the trick? If
> not then maybe adding one more state there?

system_state gets set to SYSTEM_RUNNING before running init
in the initramfs. It seems that atm the kernel does track if it
is inside the initramfs or has switched to the real rootfs in
any way. Which makes sense because the kernel cannot know this
since there are many ways to switch from the initramfs to
the rootfs and also some systems may never leave the initramfs.

So we need some sort of "userspace startup complete" flag which
userspace can then signal. This will not be without controversy
since even userspace does not really know when all events which
can services to start / modules to load has fired. But argubly
userspace typically does have some notion of startup complete,
e.g. what systemd-analyze uses to determine the end of the boot
time measurement.

FWIW I do not think that such a userspace-startup-complete flag
should be a system_state.

Regards,

Hans


