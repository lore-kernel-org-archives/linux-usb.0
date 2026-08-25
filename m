Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89890306B3B
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623627; cv=none; b=j5z3jeGjKFQndEseLcOUO/q44N85wrEO5i0gjL61weYBYb02fdd7bJDabRucDSWaTtIGTWj/ZmwF4iEoutCD1NPzyrmYsLSg/eo2miYwFHOdGW+yYU5GvJA3E6NCNw5i1pn4AI3wvrn9+6nQjNlVvvrBvD9dw08S+zacRA7tkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623627; c=relaxed/simple;
	bh=jZ9edC218ErYtuLBf01+Uq6fGVBYmGjOA1pWHaCCy+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5PDTszZsSc99yepW9HeeHG7wG9EtzUR+LyeDZxSf1N7C7QiT/2C/HVvVMf3ppS/EjJb7Xy3tk+XY2uxbfi9pGGAT+Vr2dJlNJBEkdxYSPdrUiiJGnkCPicYsIoIYy93Tb7Lg2LnGiv9SAXcM0/XU9QhY80OsO/LIG6eRKDEV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SY/XCYXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Segfi6jb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SY/XCYXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Segfi6jb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONN9mw3830534
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzF3hXZW0ytcWbA+isUMZBMZ3HrRdAr99GThHRzOSok=; b=SY/XCYXYw+5laH5/
	wZbWHkILawpV/YQ16VNXFkz4xTjcjQd1BeMgBo+CcmltD9yg780ZTLCa2awzGZQ4
	g7FdMzminkBYCfQripJxOXkrtahHTyD1g3rq/wawd0yUzQpmCQTkkqUcdkPt310C
	awNh4bqR6IR9sdJEueFAzqZWhvWKYnUTRBDXcKGguX2LAE3k4l4k4fOa88gAag31
	V4Nyse8upSj35BG/V2YW6SxQbr3VSzUox5UfbyKOeuHkehN+Et6u898vz7eqhB+Q
	1RpMNKbbhr2wLg9IdfbhPxVwQwbTRM/w0cZKwsO8eUa1pgBk1DryTEFPt6yZRiXO
	uvqHxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdskmgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:07:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc132709c76so6183025a12.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 19:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787623624; x=1788228424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzF3hXZW0ytcWbA+isUMZBMZ3HrRdAr99GThHRzOSok=;
        b=Segfi6jbLBkNB22mDlCmv98jHOU+DKW464NgEYmVJiuveRmlODsMIH53uVuiE/+/yM
         MhWSsVNGFnx6hJ80aC4kZX9HJk7O/BgBvqrcKIOz3n0CxcXT5j8RYb51aPFoe1TA7gnz
         1Cojtaq4ayNnDLkAgKf730WrAu8pfnXvDR2PD9IFVJOQszToxGRvTxObSuc86HM/Sd1Z
         lFB7P/3XEpqCUzjcRM6q2nFO9c5YKMZBxu/oVYqYIBQtEnBRPeyVdWTMSlhOu5shZNvm
         vAtCsLyM31IbBTJyHOrggPM1idi6tOjxOOWpyMT+inzv30hcXbSUVJGGKww3FD4RiKGV
         ej/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787623624; x=1788228424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzF3hXZW0ytcWbA+isUMZBMZ3HrRdAr99GThHRzOSok=;
        b=oMhBEK6VEOmpfGE6hXHDrhXOXA/UYnZhbU73ovaqIeIKl2OXwdvxtKudz1CUldd+K/
         0+lDrSuanN7i3V2dtW/RUvEH+7NN47NQDHy8HUvIDWmKzxa85KpYtMNKmPl65/wikiKZ
         hZYguEtAOlfoYQyYuCVz++nmQalbIQXtcx2s0AMbOQ/NbnVQizBwGSvEXwgu8aktCI8u
         nC4BlRDVZLuK+2y4tmV93ardeLetA7vMQcmmQQqNgfTe9XxYdueCyYydDEFFb3BVDlau
         JIiAUgF4y76uAwgNt1DCiH2xXAnUnsxW6R1jzJYafjqniP7X2EHSbmJrij6vyd7suSu/
         j4LA==
X-Gm-Message-State: AFuF++nTVlbXZxCX5q7aX+9chPjeAj4aufbGRSbuF9Z9jzdumIcah2Of
	tJ9f/prS+B+Bv3sY8PqgLdpz8PXFgK5mIPsxBjZtCYvXHpmhXfGnjTiDpde9H030C0F3nOR0Yy9
	4SUBVREgiXnMcEDFnYkFe4SYOQm2Y6KcEdpI6PGi5AMRvUbY4JBke11O8hWxce2o=
X-Gm-Gg: AR+sD13ksBt4fMwM9ebFxh0FxR/p6CU6/0j2+nnoxEy/oPFaOxNP8C0ECeSGu4byF9N
	KACKDbA/sIoWDF5JbP0+3WDFfzwh4KNvjmv5uVUR8huphOmVS9sUPczU9wY4fBZufMO9IWnaI4G
	Rc2B99yRfQTi+5aYmM327Yr2u70dAV9ROpny9pBrD4+cPJdbF3R+budk1ABT1xN4VJKtgAu86M1
	Cag9+LXBGm2CHtbLdf1B+ZNP6SNKAS1PJ/cUyYSogFFgPv17KSogq6tYDfG/av+OBtc5GAp8HSX
	w2dtD4rQKz8jt5vRhVSaZu778U0/C8YGSPIWT/WoaBimhE4iHo7UUObITwepGljxEg5XWjebef+
	1gaqEqTDLeisLA/kLBzWQa2tvIGkq+HccbYSOXOP84az2P6kuv8iU
X-Received: by 2002:a05:6a20:43ac:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3cd2fd8e233mr63445147637.1.1787623623704;
        Mon, 24 Aug 2026 19:07:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3cd2fd8e233mr63445049637.1.1787623623216;
        Mon, 24 Aug 2026 19:07:03 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d33dcsm39442376eec.18.2026.08.24.19.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 19:07:02 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:06:56 -0700
Subject: [PATCH 2/2] ALSA: usb-audio: qcom: request page-aligned xHCI ring
 buffers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-16k_offload_v1_b4-v1-2-49a6be60ca30@oss.qualcomm.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
In-Reply-To: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxNiBTYWx0ZWRfX2ilXLkXa6I9X
 ivkS55qZ5wtfiFyoUZTbCb+zTAkf9u19T+yasxec/NnCTyLV63tIb9EYb+2g1r/51KaExMj2CBz
 5kgYG+KXkJtsbJzf22dxBo0MZkgLFSw=
X-Proofpoint-ORIG-GUID: 7h_Al-zvfNT2v_ZNNCafc6VpsHARUU14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxNiBTYWx0ZWRfX1CDepyd+H9zM
 sXxf7y4LT+72owaqDZWoQMC2x+/zOsp77Ht/8J0WhaQPg2xOEtIWOU1O+tc5EKo1wwbvF/WrlJd
 SD9GJFkZOHifcRTtinHtHovNNiZmRVrwQWqzSidBKGlQtSKZ3itlfsPrk+oASiEqnmkvlyh8sfy
 B+zfBMSCkJU94ZDNdbSynB0xEmWUws5R1JexvbFb9ZWLDDn7her7lE9EoFmPpVWgwh0eXsxoAgY
 CubZ6Vjm0LF4t/vB4WFfA+QOzP+Kp6hvViKrs2IDZfMSl/oNiVJAheXdsC2+bHAmonId78wFjZ2
 5xR10iYZ6dDKuqRyZAHhM8sdJsDVGG1vdec064ZqGxpwoBdJBNluJV9KR5rxEpTMrIIa/PQQAht
 Fan7MHJQy408Fk/rEyofVLK3b3KxwzJEdKqz85hxaWMGfe1j+RFAAZUr3qOG39tPJfHO1nQiE2n
 P80NpVi3ZCcAH9DFCqw==
X-Proofpoint-GUID: 7h_Al-zvfNT2v_ZNNCafc6VpsHARUU14
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8cf8c8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CbMfP9IJxQ5wjS32uxIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250016

Now that xhci sideband supports requesting a specific ring alignment,
ask for PAGE_SIZE alignment when adding the data/sync endpoints to the
sideband and when creating the interrupter's event ring, so the
buffers reported to the ADSP over QMI always start at a page boundary
and span a full page.

xhci_sideband_add_endpoint() must run before the endpoint's transfer
ring is first allocated (i.e. before snd_usb_endpoint_prepare()
triggers xhci_endpoint_init()) for the alignment request to apply to
that first allocation. Move the xhci_sideband_add_endpoint() calls out
of uaudio_endpoint_setup() and into enable_audio_stream(), before
snd_usb_endpoint_prepare() is called for the data and sync endpoints,
and unwind them on the new error paths.

At that point in the setup sequence dev->ep_in[]/ep_out[] are not yet
populated, since the endpoint's altsetting has not been activated, so
usb_pipe_endpoint() cannot be used to find the usb_host_endpoint. Add
uaudio_find_host_endpoint(), which resolves it directly from the
interface's altsetting descriptor table instead.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 96 +++++++++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 14 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..87e016104c3d 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -941,6 +941,45 @@ static void uaudio_dev_release(struct kref *kref)
 	wake_up(&dev->disconnect_wq);
 }
 
+/**
+ * uaudio_find_host_endpoint() - look up usb_host_endpoint for a snd_usb_endpoint
+ * @subs: usb substream owning the target snd_usb_endpoint
+ * @endpoint: sync or data snd_usb_endpoint to resolve
+ *
+ * usb_pipe_endpoint() resolves via dev->ep_in[]/ep_out[], which are only
+ * populated once usb_set_interface() has activated the endpoint's altsetting
+ * (i.e. after snd_usb_endpoint_prepare() has run for it). Looking that up
+ * beforehand returns NULL.
+ *
+ * Instead, look the endpoint up directly in the interface's altsetting
+ * descriptor table, which is populated once at enumeration time and stays
+ * valid regardless of which altsetting is currently active.
+ *
+ * Return: matching usb_host_endpoint, or NULL if not found.
+ */
+static struct usb_host_endpoint *
+uaudio_find_host_endpoint(struct snd_usb_substream *subs,
+			  struct snd_usb_endpoint *endpoint)
+{
+	struct usb_host_interface *alt;
+	struct usb_interface *iface;
+	int i;
+
+	iface = usb_ifnum_to_if(subs->dev, endpoint->iface);
+	if (!iface)
+		return NULL;
+
+	alt = usb_altnum_to_altsetting(iface, endpoint->altsetting);
+	if (!alt)
+		return NULL;
+
+	for (i = 0; i < alt->desc.bNumEndpoints; i++)
+		if (alt->endpoint[i].desc.bEndpointAddress == endpoint->ep_num)
+			return &alt->endpoint[i];
+
+	return NULL;
+}
+
 /**
  * enable_audio_stream() - enable usb snd endpoints
  * @subs: usb substream
@@ -958,8 +997,9 @@ static void uaudio_dev_release(struct kref *kref)
 static int enable_audio_stream(struct snd_usb_substream *subs,
 			       snd_pcm_format_t pcm_format,
 			       unsigned int channels, unsigned int cur_rate,
-			       int datainterval)
+			       int datainterval, unsigned int card_num)
 {
+	struct usb_host_endpoint *data_ep = NULL, *sync_ep = NULL;
 	struct snd_pcm_hw_params params;
 	struct snd_usb_audio *chip;
 	struct snd_interval *i;
@@ -997,17 +1037,47 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 			goto detach_ep;
 		}
 
+		data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint);
+		if (!data_ep) {
+			dev_err(&subs->dev->dev, "data ep # %d not found\n",
+				subs->data_endpoint->ep_num);
+			ret = -ENODEV;
+			goto detach_ep;
+		}
+
+		ret = xhci_sideband_add_endpoint(uadev[card_num].sb, data_ep, PAGE_SIZE);
+		if (ret < 0) {
+			dev_err(&subs->dev->dev,
+				"failed to add data ep to sec intr: %d\n", ret);
+			goto detach_ep;
+		}
+
 		if (subs->sync_endpoint) {
+			sync_ep = uaudio_find_host_endpoint(subs, subs->sync_endpoint);
+			if (!sync_ep) {
+				dev_err(&subs->dev->dev, "sync ep # %d not found\n",
+					subs->sync_endpoint->ep_num);
+				ret = -ENODEV;
+				goto remove_data_ep;
+			}
+
+			ret = xhci_sideband_add_endpoint(uadev[card_num].sb, sync_ep, PAGE_SIZE);
+			if (ret < 0) {
+				dev_err(&subs->dev->dev,
+					"failed to add sync ep to sec intr: %d\n", ret);
+				goto remove_data_ep;
+			}
+
 			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 			if (ret < 0)
-				goto detach_ep;
+				goto remove_sync_ep;
 		}
 
 		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 		if (ret < 0)
-			goto detach_ep;
+			goto remove_sync_ep;
 
-		dev_dbg(uaudio_qdev->data->dev,
+		dev_dbg(&subs->dev->dev,
 			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
 			subs->direction ? "capture" : "playback",
 			subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
@@ -1019,6 +1089,11 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 
 	return 0;
 
+remove_sync_ep:
+	if (sync_ep)
+		xhci_sideband_remove_endpoint(uadev[card_num].sb, sync_ep);
+remove_data_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, data_ep);
 detach_ep:
 	snd_usb_hw_free(subs);
 
@@ -1140,14 +1215,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
 
-	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
-	if (ret < 0) {
-		dev_err(&subs->dev->dev,
-			"failed to add data ep to sec intr: %d\n", ret);
-		ret = -ENODEV;
-		goto exit;
-	}
-
 	sgt = xhci_sideband_get_endpoint_buffer(uadev[card_num].sb, ep);
 	if (!sgt) {
 		dev_err(&subs->dev->dev,
@@ -1212,7 +1279,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 
 	/* event ring */
 	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
-					       0, uaudio_qdev->data->intr_num);
+					       0, uaudio_qdev->data->intr_num,
+					       PAGE_SIZE);
 	if (ret < 0) {
 		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
 		goto put_offload;
@@ -1637,7 +1705,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
+					  datainterval, pcm_card_num);
 
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,

-- 
2.34.1

