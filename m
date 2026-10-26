Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024533;
	b=eBtzQruSo/S1VqV0crdX3r0PwB19EUqfFcwy64SvDr56zZXVNH7jirP5U3V7UvLvK0jR
	 sGxmU75V2ilECTHjgXiTuGCGwhE0z12wxafjAUucSKR+AxzYKdIwKQGan3Vw7DKVt+3nk
	 QjGx2temuwv2jCc8Wfm4obLrbPvNhhKSFeoJcJZRkYZftoZiTvH/MbdY1C+dhMxuadr7v
	 4u+5b89pvDtW9jE7qgvaabPdyar/+PykXvaIsoHl3pvTFit/ZYsd86pqOFp+BWHyqVov5
	 tzEA+MnI+/GWCorjX1u0chKXT29ES+TapVMSWWwTS+A2ip5hAX7voWshE8fWU7+CnTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jpsIOtFYsUGCDuyanokOYl7taLiDqxT9vfu32ZLt4IQ=;
	b=2DQ+6gRAbK7bB/hBrjVTxNyD+qJnWe6q+oIu96/svV6ZCdZklLQUyFs2x+XOjBXgwDkE
	 nrhMNNNgt9KUqdp01Yo9HabK84e5zl3PG3lLAgsb09+DvPUNrFzoZHCXDemYqLv7smDJr
	 Lcjkgh9ddxQUjt8mQqFigTVRucKlHgu/YMfO66finAhEvxVp8goi3LGbl8pbyeOko+cpd
	 pDAUW6F0R16XJKJu8HP5D3EdOjJy8LLSTeLxG09vamHc9VRPtahPBnBSf0Dken0UvAyc5
	 0tpVaH1je6MGhYIyFnaRdb4HQnmyeHAQJKpsHJU5oT3kGXDqPn2bHiUeapDJcCYHpEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7CfVDWl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gv4i1TRP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056D606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0056D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7CfVDWl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gv4i1TRP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsrpC3033637
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpsIOtFYsUGCDuyanokOYl7taLiDqxT9vfu32ZLt4IQ=; b=R7CfVDWlE4Wv8Tb2
	/eqeEXuo8UpfGp8lZ+qPtdW+rC/5DyjRsrbfwF84NEgf4N5xDcinntoYY2tK2b6v
	SGqBAeDdS7Etye3mcTAf3Hk9eiv7o2XrpYMDrCf6CGBEkZ6stE3YrIPWcDML7uuh
	c+XM5KiIMcaaaSuw6IYchbfMGEjNImzDI090WablXrokQ/wsknXEI+M4pTGhSsfi
	uj/0De/srIR+uVIQ7mV4OKvGekx/7cRWfZ3kEpIRoFVt4nPQPyjzBMHilEbCaGoO
	I0XI+rQav2OJ/WgyjGng9MEIPOmsXato3mJBNrnCrRjNbxeYF/+9pmg8OkFF22yo
	h8xxVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0ttr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:22:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so548029985a.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793024530; x=1793629330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpsIOtFYsUGCDuyanokOYl7taLiDqxT9vfu32ZLt4IQ=;
        b=gv4i1TRPe1OYNBRIZeJmYgHIMZqEIDoy/ho4jBZFW/GsUKJrZ7l42fTXnPlTDLWxuc
         emqW/Vg7okVktUNxTf+fmWvae8jbDED0txOmQO1owCCnopdY/29RFkIvNLL6haAeRdeQ
         dHz/OY6+X4hCT4zJfTKLQm1+SGagm7oLayIGqnXj1/ozbR4AtiONWOCN3Q5G8u5zAXjt
         MCg4aKqbF5fND24qz/XySbTAxkkufkBJJwWjnKRwKiFA3i3w4ToKLalqwwiy7u1ScxZA
         Ej7qmBWYvEhL7XzvfmVxHXdpO6UXWJjh26KlesvZ6bHU5JiBYauDCxudhfaARObEGi1L
         hyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024530; x=1793629330;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpsIOtFYsUGCDuyanokOYl7taLiDqxT9vfu32ZLt4IQ=;
        b=bYHZ9cYVrvmq+U1iFx2iGUqx4HS1vKpW46ozRplV8MyfVwA28kSGMenRSqaamoIsli
         eqjvkW6TiEyuALZYi18lktAaXbUdEoI6FI5D8hBe1EgbFVMW4+LT8bLgnubNO8DpDnWY
         tTSGd1jRsBStpy+wFN/77fsRy/fsxUwB0CuUQPt4VplIxN1vY4qT9TbMVHUfMi/Nj6Ku
         j7hMfk1+YAzoy1dt8D+aPoXeYITgyAVhAXMhvQCEK0cx9MlvsGdGhPLqdtoH+UTATuhq
         S0UTvPhQBpESp4FAGeX48R9ZkYDXKLt5w8Wa4onMrAp2gjz0CWVanvBzmDG/3up7bVxL
         5Knw==
X-Forwarded-Encrypted: i=1; AKwUvBwtZCInaEA/vioKo3vAOvVdHOP+3HTVmbBRLiM8eKeGQOC46uadspi+vGKQim7qUU3alqtFCrhUk5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVmP73nEbmejYMly9BPOLlFQQfTtCWBjaEnd31W5A0OCJWBXZF
	E8WkSfNnaEnlv9NAeA9htWZD6nL03b3IHZTWNhsUQW1v/xNt97BLJrYfddnZR5LxuSK1pFrU6of
	AglH7bKxxWkBY8fGEOwCt8VCKNchb1Qcbpa2fYM0NFpLguE5/2CRKR0ai6ObOSwM=
X-Gm-Gg: AYBFou0HU2pSnU+y2cKQ49rUjKxzUzllXjuDVNvJ4czLIEiIaib1NWTWIX1VTAEgRYy
	BxgDIOBa9/JqjwT7fwXssq+uH7kPPXrkOMPbPyOkEWu+yFwo2I5R3AE6X4CXNfckR7ZvGXzJ1tU
	inrkasRDru1Jo2FGUU3Xxr0DdOtv+7y4s1TXaELcta/2zKY9x+O8/hBtFapnYtU/OPLYd5icn1H
	LL4MmEv9LnvEpx5Wy2YR257cgHRc/HWVlaE+XgIVP741xlmc9AdgVhEOZ/1NwZawGrlzYFjYt1E
	aJMLOL2Jykg6g4zBw41AVYQSrIaWtz8E1/GZhHTaPFhNGTDpH1qMMkzkAd7SH3t2B8IYN0U14x2
	tA6wlVlx1VrzMBbNt+lY=
X-Received: by 2002:a05:620a:688f:b0:93e:71b8:584b with SMTP id af79cd13be357-940ef93db07mr971095785a.34.1793024529869;
        Mon, 26 Oct 2026 07:22:09 -0700 (PDT)
X-Received: by 2002:a05:620a:688f:b0:93e:71b8:584b with SMTP id af79cd13be357-940ef93db07mr971089185a.34.1793024529184;
        Mon, 26 Oct 2026 07:22:09 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6573dfsm323179466b.52.2026.10.26.07.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:22:08 -0700 (PDT)
Message-ID: <b0bc482a-f739-4c9b-8eef-9e2634ab2e02@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:22:06 +0100
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
Content-Language: en-US, nl
In-Reply-To: <20261026123716.GF158991@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX5o3OGSs6rY7d
 vaH1fHmjsgLIV1Mlwho4hKu3JrXGRlMV5AXWZBORzHfJzXdxwUHkVrus9OApR1Yc/K81Ac+qdnA
 Uqh4zogQiPxxQ7IK5/OMv4fqkxeXlbY=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf6212 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=TCbpMuZolx6SB4zJOeMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX0H47RDkHx+M8
 n6sRGLoigvGuV4ktyKloL50CnQ+pgW58tLvoxxCX42ySXFqj1YX3zC4AG5s7oZVC39fhaG3Rhyd
 ShQP6Ov75nD44hUdsUWNgW7+fgbMqEtj2PNFOe3yUdEbjbjBJLfOuozCyAExE9L5WNmfGYhJtpe
 gZzQfnSbSU2ITK7ncaFeoPLpAZnkp63shq1XDAP3sgV3qS4e2I1amvgYi6QvsGV2D/73IcDNJqS
 pCXSV/vIVr0AXPaVa08Qq2MOkndL9q356NjbvoZN6KSH5w/+uooQY9ojZwBHuMXJY8m7GkNSZcT
 2FmOH4xYSgCplAGBMjlBuRb8A+e4ROgEblBa2DsGtiYd+wSWCUBbY/ImeLwO/jDgFTI77L/NY4I
 htz8bfLT2kEWJettwUXXWuP1CdDrlYOOprgF7YpK3S20Xsmx6Hl6pJJM/cNwqOEPZK1oJzzVDsM
 i7zahd7MMS1VPytZTuw==
X-Proofpoint-GUID: W_Bur-tMU6546JEC29x8I6ffdKaV8nRh
X-Proofpoint-ORIG-GUID: W_Bur-tMU6546JEC29x8I6ffdKaV8nRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

Hi Mika,

On 26-Oct-26 1:37 PM, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Oct 26, 2026 at 11:48:06AM +0100, Hans de Goede wrote:

<snip>

>> p.s.
>>
>> We had a similar problem with deferred_probe_timeout handling, see:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/Kconfig?id=56e3ee721b33bdc4ce0765d370983aa4384f8a59
>>
>> there this was fixed by making the default timeout value a Kconfig
>> option and letting distros override it since previous discussions
>> did not lead to a consensus on how to handle this. But that won't
>> work here if we want to deal with the "complication with add-in-cards
>> that don't have all DP INs connected" case.
>>
>> I'm mentioning this because it shows there is a generic problem
>> with this "timeout design pattern" trap us kernel devs seem to
>> keep falling for, especially in relation to things not happening
>> in the initramfs while it waits for user input causing all
>> these timeouts to trigger while they should not trigger yet
>> because more drivers will load once we switch to the real rootfs.
>>
>> This has made me thinking that maybe we need a bootup-done
>> or at least switched-to-real-rootfs sysfs file userspace can
>> write and only start timeouts like these once userspace has
>> written that file?
> 
> Yes, I think this is the way to go forward. Then something (like
> notification or callback) that drivers who are interested can opt-in.

I'm glad you like the idea.

There are some details which we need to work out. If we enable this
unconditionally in the kernel then all timeouts based on this will
only work if there is a new enough userspace to actually write

"rootfs-mouned" or "bootup-done" to:

/sys/kernel/boot-stage

So my suggestion would be that the initramfs itself will write:

"initramfs" to "/sys/kernel/boot-stage" early on and that activates
this mechanism pausing any potential timeouts.

The problem with this approach though is that this means starting
the timeouts as before, cancelling them on "initramfs" boot-stage
and then re-starting them on "rootfs-mouned" or "bootup-done" .

With the cancelling bit feeling a bit icky, although I guess this
could all be done with the same notifier depending on the notifier
argument so this might not be too bad...

###

Once we've an API design we like, the problem becomes who is going
to write the code for this and lead the attempt to get something
like this upstream. I'm interested in this, but I also really do not
have the time to work on this atm.

Regards,

Hans


