Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D20010F0
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228077; cv=none; b=Y1+9OPv+m975DG9mxUgis8dBdJnS19B1GeFEnM0ngbPhHQuSXi8CZY2346SKiWSs+OBxmWwglVjoD1TreaPxe4EDWPVyftdl/JdetKlO8j9ClmxqvUYxfBpBRkOPVagQ1D4uro37awzPJP6ir9n1OoNvjHDuqdG9SWsTpsz8Mlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228077; c=relaxed/simple;
	bh=m0mqXp/L4NYAliNvESwDxjZzwPRKrj49DV+95SHBRag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IK2CTS9DVLp4KtQ7MnVflGWAStRTtN+l+gLBMnJGb5vBXHUIVk8QnAnYISb3AlWcLR5UGPFf96dH2RG0bfM2TP0PeFYpYG90DjNeRMMyMbrFmdCow6xQ5HoEuugA7rD2oqcdh11+v09Mvu0tCNfArndFMUE/RcOiMvCv7dtFevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnrbMgc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOK74Sf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnrbMgc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOK74Sf6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82GWX1908831
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gpcvhl+CmNwOIWKQw+IpLH7DDR9BksAce/j5uOpH3Yg=; b=WnrbMgc+PJzRvxSZ
	TDv7uSQxD8VcIi6ae9aOkdNpeRiBXhcsT+8cOx6U0x2LChdxRgKO/lzJhhRHYT3t
	La7g+LcprKe6iN+/XDTA2f9H9FECwn+VsbKzmDCpKdM7dP/4NsbKxl/SZmw2Xlk/
	7zZyCFeWzEGHwEtEeoHCl/FOltJ2DYVb84zbkzzPqDEhVsDVBaZGToGY4X07bWOH
	xQ1EuSUbZ+XYTgtluP8ubWMEqrQlcGqB8p9iN6p2fqW0iFwMPPCTVngbrUIAo7Gv
	4Kumv1yO3euBHETTHyzlGbtJ4drs1kjhO/2f0bJYchSCnK6zXdkEzxJ6QXJs0Ylm
	P3r08g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8bcqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 08:41:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so9239186d6.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228074; x=1785832874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gpcvhl+CmNwOIWKQw+IpLH7DDR9BksAce/j5uOpH3Yg=;
        b=OOK74Sf6KOg3bq4HcoEWdcxBqwbB9bgmoD38PAo4c2yZjqiDiXsk0DmT7k+3dykkwr
         GxuWCYhEgmxKb8N0EpBC9tkWCHoYALhgwEQA+96M0LnfMR6DEJD6fpIJiFqA7wk6SYYz
         BSuuX2JJLWzo41opYx4UoS48rSTcjxhagjdufJhnaFZQa2t+u5e8w9lH2R3eygxdK1Az
         u0vCzuQyu0iOWMrtl843zpgK5v/eeBC+AYph0ARIWJ63UPFwPpCIlUC7urwJUPggRogb
         NYRuIKOFywMTvD9C/uCrjGlUBTZT+jFnOHM95VA2PxP6F0kNZFArfWb6YsW55qfpI18h
         PbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228074; x=1785832874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gpcvhl+CmNwOIWKQw+IpLH7DDR9BksAce/j5uOpH3Yg=;
        b=W5i5OxZFEn08CvoYgX73/nc1dp2rcMtXiHdLRp6EEyAb9+M8dlU9vMybR3AdA9fpE3
         SKMJWH1wdAnDZB2Aor8BKtsjLSCZJfjr42sMSeqPLE3/ThIp6WMAmi2GAxXMeK7hQQWY
         XgQGQi5SUFnMJiHZX3FIr9p1fHaafSZRY9G1dmDUKZCuVNlem1kVX0lAJTT7BYGex7HI
         nc3+TPnFm7QTPddInIYo7bE1PaJR3oveCmnXmF61OjvZ/961ROrDt73iMiS9FVFw/n75
         GDX77mV5r8iTeZxfRtNqXrzWGleRit/82NYBj7+1DYzCjWmrpi3pRQwGTH49sq2T4Gyb
         6hZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRpbs5ByzP7qSVGVmTbHXtjXnargr8q4EsVrxkBjl0y4pjgb1fr4TwVIm/HuhJV+rVrCH/d2//x3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Zcb6E5H44qv2l4VtaffnA8PPV753kxMFXFDslUlP1A1E/tY1
	Tfj8z9dJ++8iMs6fTEOpY4W0LW2oeUpI/jD55hecpJ1r3a3kp+W7XAbsebj0d4uJuw/dofYwt2T
	dvAxmGMWJcAsmzsVwaW5z20EL6fcJ5EhUuv9DfO5f7hqdSMLlxLZFBQBYAFbFS/Y=
X-Gm-Gg: AR+sD12MwfSlEjJ48MauCIx+6VpL4NOOh9JiidHFMDcSJHGFdyfg4uzQLNV9uwHzYdd
	nEnGabZMYqNYCjn6r7jnRms0pYl5lJiRhmZdEJuBzRx4+c6fqZe9RdaYl72BUVcX6AFoQhSedJG
	kyavao4Kn2JD+8KVRqzYQ4EqdSQ6Uz2Z/Ixd9hWrhSV7szzatrNV3zkturu3R4mN134W7ScHdcf
	gUnqqaZ27nBoz7bcrBSeshj46EynMF6Ld3CrZK3OSi2aR9A9XG5a7OrWitg3f8YcIOYQ3jb0Rzp
	GC0ui8H1robRj5b112kyFqMxyT/0EiUhZqeRyiulVxlezy84B/nrl8FI1HmZMxVZZGfFzT+ih3t
	bZnbj0XGE/SwMTjmjZU5hd82s
X-Received: by 2002:a05:6214:1cc3:b0:8fb:7e7c:b489 with SMTP id 6a1803df08f44-908172f6440mr10311156d6.4.1785228074533;
        Tue, 28 Jul 2026 01:41:14 -0700 (PDT)
X-Received: by 2002:a05:6214:1cc3:b0:8fb:7e7c:b489 with SMTP id 6a1803df08f44-908172f6440mr10310846d6.4.1785228073930;
        Tue, 28 Jul 2026 01:41:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a78e0fsm710689366b.2.2026.07.28.01.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:41:13 -0700 (PDT)
Message-ID: <f26077aa-f3b4-43b8-b173-f40f0aafbb9c@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:41:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-3-026487a08119@oss.qualcomm.com>
 <amFDhkvhqQHtIk7w@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amFDhkvhqQHtIk7w@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfXxj4AYAOkmXjf
 lldPeTZdpC/ubRleNOAHwvbI3lArmyOKpD+gOPthOteViWmhzjSGQwMygrXhdIlnqzqAVT4+MJ3
 zaXPheYw107KS1hX4je0Xzqt5QjNesc=
X-Proofpoint-GUID: Mz9zkRi8R-t_o-Adz3SmF7e58GKmBYtg
X-Proofpoint-ORIG-GUID: Mz9zkRi8R-t_o-Adz3SmF7e58GKmBYtg
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a686b2b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xwCrwQk_th02FEdBImkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX613DhFjsVuZo
 XY3A09BlxCFiJyUrRn9xxo+l3xJRS9ofJyxwpq4RaJagN6iXaqzb8x0FSrJCyOLAeGPXpMXLJVJ
 0546mc9KQeDEBng8TQMYtU3dYxkbgtMgL2ZkMERzczg60287EQrriKOF4Ww5dAZsa9wsmT4LDwS
 TnwGRjVPL08mIrf/U8kJEJGpO3i66UFn/MB9K7tVqZIR/vMyswkaSKmeBy+ju19Ee49uQz5IsPb
 HISiGSucKHMoG0X48zTcnmZjRv8jcDy7ODHK9CoVGGS0niogtoHWXBnvETy59vfskNJmeJrTlov
 a4THd1CEKP5s5U+tL2cyHbdGI7H2GYWw9jCBpKEVC5qdzIJ4TC8z4JIhd0HLYgR8T0b5B1SQadN
 u4A0XQu9+KDc+EX+6S+xXCqg+cUR0Uj+QYoCmxF5TVVehjacaVq2bdeyxvE97QP8JbIuRn5FR2c
 K51gIoQ+2mgigy+Oqvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280074

On 7/23/26 12:37 AM, Thinh Nguyen wrote:
> On Wed, Jul 15, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on the USB core to create device links
>> for tunneled ports, so that the USB3 controller is only kept
>> runtime-resumed for the duration of the tunneling.
>>
>> Currently, retrieving that information is only possibe on Intel XHCI
>> hosts, through a vendor-specific capability. Extend xhci-plat to allow
>> plumbing a custom one.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
>> index 00751d851831..c5042766a486 100644
>> --- a/drivers/usb/host/xhci-plat.h
>> +++ b/drivers/usb/host/xhci-plat.h
>> @@ -22,6 +22,7 @@ struct xhci_plat_priv {
>>  	int (*suspend_quirk)(struct usb_hcd *);
>>  	int (*resume_quirk)(struct usb_hcd *);
>>  	int (*post_resume_quirk)(struct usb_hcd *);
>> +	enum usb_link_tunnel_mode (*tunnel_mode)(struct usb_hcd *hcd, int portnum);
> 
> We should add a boolean tunnel_mode_override. When set, ->tunnel_mode()
> is called before the standard xhci v1.2 ext_cap check. If the
> ->tunnel_mode() returns USB_LINK_UNKNOWN, go to the standard path. This
> allows the quirk to selectively bypass or override it.

That's contrary to my understanding of what we were supposed to achieve
with the introduction of the standard check (i.e. one would expect that
if the standard capability is exposed, we should check it, and only
fall back to the platform-specific one if we must)

Konrad
