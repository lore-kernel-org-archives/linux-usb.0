Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99778488D83
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044492; cv=none; b=Ve+Osw3JHPOmWjhxqjdbpDHKhvjcpNqt4807dhXXuzn4ojonq39OLwUJppTkNvjRm/fi8t/fTrzWgBA0gPOHqxxdttvF8xnj0K6Ly5V37raZ/SSlg2BniDcWsHhApxeKxtF8VinV3RSKE//vz2dubYA/2EgumbZjMD5vsvPJJLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044492; c=relaxed/simple;
	bh=mdFqA9b1vwv/HgvAJdzR9haYudDRU1I1e9rqnCn/1Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzKDEFvs1HPnvROKhhh7sTS3TF0jdnAAKtwzgIn22SSnG0TlQZrdPA1J64iX1EpfF+rPtPtGhV50qo0IPhifQ4tkn75EIckPc6l2DgYXMXidd+H3T917XuqpuTyaaYa5WQlHn056DkqW9Xw2fbD6vjwPkxtmfat+HLyusRWKL8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgI+rvFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG3uASiJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgI+rvFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG3uASiJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7h65244656
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ij3/oBZ1i0OirLfX4+rwP5dv
	ng06nvVC7F+lzK7bFHw=; b=QgI+rvFSIYHLoiTvE6Sx2A1sxUQ3ysn3nK4LxX2j
	9uU+/m74yZGnBd01wax7Qq6a67FxQyNKjvsw31BQlPTk4QngVdmBJmWDiFOxPnfj
	79bNK/PubU+SO2qYPUGmOeP4QCfztAC6DcNZYkJcwaYXyOB1CyAcOGnkhUQro5Fs
	uMx01Rigi/qI/SpZtkaVEvC6n3tyWRCY3HoWsFkxYWn4RQuF0Utsi30luYK7J/VM
	Ox69S/uE/KmdUuzyXsUhEoqvTNNBJazFyNXkc4G3JEN9DeV9xaQymDuwXrVa10mk
	gCVPVCyKQHGPFuPWU315NyNCpzS/zF30Ui2S6wvGAVbOKg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfkxdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:48:09 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b352d9062fso8985041eaf.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789044488; x=1789649288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ij3/oBZ1i0OirLfX4+rwP5dvng06nvVC7F+lzK7bFHw=;
        b=CG3uASiJzxs19f9aULAXvwFmWkOR5/uRc//jmmGWfIcdp9ISgBT+WwsR3tBpiHEDsu
         t4MTBq14w/6cweuPsrFd6kSGnYgRyL0VjVFmrlouNQUkczdyqckyfWVyqwghaBqzoMQm
         tLNyF8ts2qPTLAjB3yaFfPTE4aqXmzGIbLFFalxDrTN1t2FnZi+qRuPYgMjjIU9nHu8a
         lCdKqT9zp6nmuXTrd1yAXzKgWqOW1u1NUdn6LS656VBaS9E+3/tacbdq1ZM+ebN5ARrd
         LFE1LAdveya2irKt0SWBHp61JYAZ0q97rThPBreU7V1xpQoih05W1aM3YvZzI6rPZEnD
         R9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044488; x=1789649288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij3/oBZ1i0OirLfX4+rwP5dvng06nvVC7F+lzK7bFHw=;
        b=M+v8IuXl3AWrHUaqLNLdKcpqR9FtsJWFk1Y8rsB9Xw+9bAf9G7nUPwvCw4wInop1x9
         6/GDytVVQz8nU+zByHboiSSJicIs52hM1DWLuJDDLlQiQN1xJsbzzbAH53wuzWviZPfb
         gfjaCysOHQRrAXc3HVsCzuQG3SQ9B7utVS2CROTmXTQPM3yqGrfZO02uGeQ9GGvXLkS+
         Qgppv6G/bRoha8O0QeQfafIP6b9hau2DkxH9sXpSNwo8ZVyIiX8EjXl7SGChSYtReO9R
         +fqgJwVwMsXrgof22z/PwWOn/b7qqss6ZiyInzL6cQyhVRsWn7AAW7zZYIxPsgRLjqHs
         nxIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs5HPBhegG/+NIh7QBnNZZe+xs5NVt3ZmEGFXsX66jBBMEsCn0DFamXsmCUvXO7FfL3SPt11MxNoc=@vger.kernel.org
X-Gm-Message-State: AFuF++luw0O9y6hOWULVGJViQVQRkYGPUQNzPK13jbEnCMnCwItDh+g/
	o6ZXjRclNiBJcAXeAKMWpW89Kuou2TC0xbgOOCA8uUt7YmsL51blxgKKdwrNkGdULZXEmwsqb8K
	bdwKUYRxMJWLvmB+8VgG6aI9RsFPuh98ammei16ZhrkVRAo+bJOKlsLdUUQQx/Zk=
X-Gm-Gg: AYBFou0Yoe1LOAp+VbIPhmKwH77i+vSyIC8NwPwyVa7DnOJ9HGIiAELXQNFp6YnTWVM
	q+JNZRnb+3rbQ5CDrOb0Gqk1/ukk2ix6Yo+QwC6SJfePAi+/IfjEfI/IedJEghDy1C0g5whoNHt
	DLEpGhoU1QwIHg93pFi+Mj1psId0xj8+gWbabNuBTASIj2HihHqQM7f3TL2NvQfZDqlOu25zU7w
	8FpTtTuOcz7VWxPi8duNV1r+BTOsTLSXB3NhM/t+xhnfvVXHsU8Khs2I8S/4RZQ3GelONAbVziC
	E3JQcu3/E0caWCIplzfa8WCwYKyIZ0DeZ9QEnCpnrIZLxmlwZJi3RgLDNd6nRaheJkHm8OLand+
	Fhi0aEYswEbH47RRAdEyJL8igO6M=
X-Received: by 2002:a05:6820:1622:b0:6b3:5475:4855 with SMTP id 006d021491bc7-6b6fcfddf2dmr25661238eaf.31.1789044488203;
        Thu, 10 Sep 2026 05:48:08 -0700 (PDT)
X-Received: by 2002:a05:6820:1622:b0:6b3:5475:4855 with SMTP id 006d021491bc7-6b6fcfddf2dmr25661211eaf.31.1789044487664;
        Thu, 10 Sep 2026 05:48:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm52628275eec.9.2026.09.10.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:48:06 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:18:01 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "usb: dwc3: qcom: Add support to skip phy
 management by USB core"
Message-ID: <20260910124801.lxybhrpskeqi4i4a@hu-mojha-hyd.qualcomm.com>
References: <20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1MiBTYWx0ZWRfX5JTzac/oJwc3
 JBxyQ8DKf5AcpeHZ5fSI2cfpd/mrc1+y0jgaUukQDLDJtKMGisrlZAF6lENDcnRS7VSkMMf3qPE
 lYQ0VjKC9M/l2sS3Jlr9XlfkkgNRCKs=
X-Proofpoint-ORIG-GUID: OIvPVG0eD7ZnmKt3OVj7tE1Qu2KTeBSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1MiBTYWx0ZWRfXwAzuUtqjFK8s
 aZTrTjlli9C9/3st0HFdioL5BBy7cIMBFlPXExuFYYyN7qDNg/Pp2qer3t7MdyBDKUG3NvC2eki
 ad0J/JOokGmBSC+CEL325oBQ/OZTIpP/sfb5/RXKileD/j9ombtr0GIk2jZo5xigdwZNvmFIDOx
 HqP0EVzxg6govuIFfc64zuHMGQEoxLYy70m82PR75fjonKlQo15IfTAWMgaImxtzJxch2kxm83O
 jwmPNPM0sgfFI+IbQga54dsmAhkMhBEbpmlbQjHlmqPI3S9B+GLpCMbPc2cAMIU873otq7tTDzY
 4sK1my4SiNxFDIPpaUsrv+JPUfJGUinns4dR/6IhRvCSC2sFsxiKY8gC2pZJfdK6Xz6YflTA0Ce
 HAUgyAp6hjl+g45RwN/EGcOie8M1VzD4g8fTqMpw5yqg1GLoOfTBziTDobnrYpQrsVJfFc1GKBL
 wsbB8ajdeDtmtegOoSQ==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2a709 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZHuVh4Jgrl5pHFg6gWUA:9 a=CjuIK1q_8ugA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: OIvPVG0eD7ZnmKt3OVj7tE1Qu2KTeBSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100152

On Wed, Sep 09, 2026 at 03:19:10PM +0530, Krishna Kurapati wrote:
> This reverts commit be7b1c68cd3e4fc0f5a4e1b85696de1052f21f2f.
> 
> Commit be7b1c68cd3e ("usb: dwc3: qcom: Add support to skip phy management by USB core")
> is causing a regression on qualcomm platforms.
> 
> During role switch it tends to cause the following crash:
> 
> [    5.620951] refcount_t: underflow; use-after-free.
> [    5.621114] Call trace:
> [    5.621115]  refcount_warn_saturate+0xd8/0x140 (P)
> [    5.621117]  kobject_put+0x11c/0x230
> [    5.621121]  software_node_notify_remove+0xdc/0xf8
> [    5.621124]  device_del+0x1dc/0x328
> [    5.621126]  usb_disconnect+0x1d8/0x348
> [    5.621129]  usb_remove_hcd+0x100/0x2a8
> [    5.621131]  xhci_plat_remove+0x8c/0x170
> [    5.621134]  platform_remove+0x28/0x40
> [    5.621135]  device_release_driver_internal+0x174/0x290
> [    5.621138]  device_release_driver+0x20/0x38
> [    5.621140]  bus_remove_device+0x19c/0x1f8
> [    5.621142]  device_del+0x1c4/0x328
> [    5.621143]  platform_device_unregister+0x34/0xc0
> [    5.621145]  dwc3_host_exit+0x50/0x70
> [    5.621146]  __dwc3_set_mode+0xa4/0x378
> 
> [    5.644535] Unable to handle kernel paging request at virtual address
> [    5.644657] Workqueue: events_freezable __dwc3_set_mode
> [    5.644664] pc : __pi_strcmp+0x9c/0x140
> [    5.644668] lr : software_node_property_present+0x60/0x98
> [    5.644697] Call trace:
> [    5.644698]  __pi_strcmp+0x9c/0x140 (P)
> [    5.644700]  device_property_present+0x9c/0xc0
> [    5.644703]  dwc3_gadget_init+0x230/0x7b0
> [    5.644704]  __dwc3_set_mode+0x314/0x378
> [    5.644707]  process_scheduled_works+0x1b8/0x538
> [    5.644710]  worker_thread+0x1fc/0x2f8
> [    5.644711]  kthread+0x114/0x148
> [    5.644713]  ret_from_fork+0x10/0x20
> 
> Revert skipping of usb core phy management for Qualcomm platforms to avoid
> the above issues.
> 
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool/
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

It was causing the  issue on Hawi too; revert fixes it.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi

-- 
-Mukesh Ojha
